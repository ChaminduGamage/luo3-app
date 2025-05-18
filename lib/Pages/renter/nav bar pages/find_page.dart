import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:luo3_app/components/renting_card.dart';
import 'package:luo3_app/components/vehicle_card_with_button.dart';
import 'package:luo3_app/theme/colors.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_polyline_points/flutter_polyline_points.dart';

class FindPage extends StatefulWidget {
  const FindPage({super.key});

  @override
  State<FindPage> createState() => _FindPageState();
}

class _FindPageState extends State<FindPage> {
  int? selectedCardIndex;
  late GoogleMapController _mapController;
  StreamSubscription<Position>? _positionStream;
  Position? _currentPosition;
  LatLng? _selectedDestination;
  final Set<Polyline> _polylines = {};

  Set<Marker> markers = {};

  @override
  void initState() {
    super.initState();
    _startTracking();
    // Get all vehicle locations from the database
    _loadVehicleLocations();
  }

  void _loadVehicleLocations() async {
    final querySnapshot =
        await FirebaseFirestore.instance.collection('vehicles').get();

    final vehicles = querySnapshot.docs.map((doc) {
      final data = doc.data();
      data['id'] = doc.id;
      return data;
    }).toList();

    final List<Marker> loadedMarkers = [];

    for (var data in vehicles) {
      if (data.containsKey('location')) {
        final location = data['location'];
        final double lat = location['latitude'];
        final double lng = location['longitude'];

        loadedMarkers.add(
          Marker(
            markerId: MarkerId(data['id']),
            position: LatLng(lat, lng),
            infoWindow: InfoWindow(title: data['model'] ?? 'Vehicle'),
            onTap: () {
              _getDirections(LatLng(lat, lng));
              _onMarkerTap(data); // pass entire vehicle data here
            },
          ),
        );
      }
    }

    setState(() {
      markers.addAll(loadedMarkers); // assuming markers is a Set<Marker>
    });
  }

  Future<void> _startTracking() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return;
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      permission = await Geolocator.requestPermission();
      if (permission != LocationPermission.always &&
          permission != LocationPermission.whileInUse) {
        return;
      }
    }

    _positionStream =
        Geolocator.getPositionStream().listen((Position position) {
      setState(() {
        _currentPosition = position;
      });

      LatLng newPosition = LatLng(position.latitude, position.longitude);

      _mapController.animateCamera(
        CameraUpdate.newLatLng(newPosition),
      );

      if (_selectedDestination != null) {
        _getDirections(_selectedDestination!);
      }
    });
  }

  Future<void> _getDirections(LatLng destination) async {
    if (_currentPosition == null) return;

    final origin =
        '${_currentPosition!.latitude},${_currentPosition!.longitude}';
    final dest = '${destination.latitude},${destination.longitude}';
    const apiKey = 'AIzaSyASPHYoVQsxpwbTTGvYugm-ttNCTY5vpsw';

    final url = Uri.parse(
      'https://maps.googleapis.com/maps/api/directions/json?origin=$origin&destination=$dest&key=$apiKey',
    );

    final response = await http.get(url);
    final data = jsonDecode(response.body);

    if (data['routes'].isNotEmpty) {
      final points = data['routes'][0]['overview_polyline']['points'];
      final polylinePoints = PolylinePoints().decodePolyline(points);

      setState(() {
        _selectedDestination = destination;
        _polylines.clear();
        _polylines.add(Polyline(
          polylineId: const PolylineId('route'),
          color: Colors.blue,
          width: 5,
          points: polylinePoints
              .map((e) => LatLng(e.latitude, e.longitude))
              .toList(),
        ));
      });
    }
  }

  void _onMarkerTap(Map<String, dynamic> vehicle) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        bool showRentingCard = false;

        return StatefulBuilder(
          builder: (context, setModalState) {
            return DraggableScrollableSheet(
              expand: false,
              initialChildSize: 0.5,
              minChildSize: 0.3,
              maxChildSize: 0.85,
              builder: (context, scrollController) {
                return Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(16)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10,
                      ),
                    ],
                  ),
                  child: SingleChildScrollView(
                    controller: scrollController,
                    child: showRentingCard
                        ? RentingCard(vehicle: vehicle) // pass vehicle here too
                        : VehicleCardWithButton(
                            vehicle: vehicle,
                            onRentNow: () {
                              setModalState(() {
                                showRentingCard = true;
                              });
                            },
                          ),
                  ),
                );
              },
            );
          },
        );
      },
    );
  }

  @override
  void dispose() {
    _positionStream?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            GoogleMap(
              initialCameraPosition: const CameraPosition(
                target: LatLng(6.9271, 79.8612),
                zoom: 12.0,
              ),
              onMapCreated: (GoogleMapController controller) async {
                _mapController = controller;
                String style = await rootBundle
                    .loadString('assets/map_styles/light_map_style.json');
                _mapController?.setMapStyle(style);
              },
              markers: markers,
              polylines: _polylines,
              myLocationEnabled: true,
              myLocationButtonEnabled: true,
              zoomControlsEnabled: false,
            ),

            // Search Bar and Filter
            Positioned(
              top: 20,
              left: 20,
              right: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    // ignore: avoid_print
                    onTap: () => print('Tapped search'),
                    child: Container(
                      width: MediaQuery.of(context).size.width - 95,
                      height: 45,
                      decoration: BoxDecoration(
                        color: Luo3Colors.inputBackground,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 12,
                            offset: const Offset(0, 6),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          const SizedBox(width: 10),
                          const Icon(Icons.search,
                              color: Luo3Colors.textSecondary),
                          const SizedBox(width: 10),
                          Text(
                            'Current Location',
                            style: GoogleFonts.inter(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Luo3Colors.textSecondary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  GestureDetector(
                    onTap: () => print('Tapped filter'),
                    child: Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                        color: Luo3Colors.accent,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 12,
                            offset: const Offset(0, 6),
                          ),
                        ],
                      ),
                      child: const Icon(Icons.filter_list,
                          color: Luo3Colors.textPrimary),
                    ),
                  ),
                ],
              ),
            ),

            // Bottom card
            Positioned(
              bottom: 20,
              left: 20,
              right: 20,
              child: Container(
                height: 225,
                decoration: BoxDecoration(
                  color: Luo3Colors.inputBackground,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 12.0,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 16.0, top: 16.0, bottom: 12.0),
                      child: Text(
                        'What you need?',
                        style: GoogleFonts.inter(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Luo3Colors.textPrimary,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 8.0),
                          child: Row(
                            children: List.generate(4, (index) {
                              final isSelected = selectedCardIndex == index;
                              final cardData = [
                                {
                                  'icon': Icons.car_rental,
                                  'title': 'P2P Rental',
                                  'subtitle': 'Search your rental',
                                },
                                {
                                  'icon': Icons.drive_eta,
                                  'title': 'Drivers',
                                  'subtitle': 'Search your drivers',
                                },
                                {
                                  'icon': Icons.business,
                                  'title': 'Rentals Agency',
                                  'subtitle': 'Search your Agency',
                                },
                                {
                                  'icon': Icons.car_repair,
                                  'title': 'Repair Shops',
                                  'subtitle': 'Search repair shops',
                                },
                              ][index];

                              return Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        selectedCardIndex = index;
                                      });
                                    },
                                    child: Container(
                                      width: 145,
                                      height: 150,
                                      decoration: BoxDecoration(
                                        color: isSelected
                                            ? Luo3Colors.primary
                                            : Luo3Colors.inputBackground,
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                          color: Luo3Colors.checkBoxBorder,
                                          width: 1.0,
                                        ),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: 50,
                                            height: 50,
                                            decoration: BoxDecoration(
                                              color: isSelected
                                                  ? Luo3Colors.inputBackground
                                                  : Luo3Colors.textPrimary,
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                            ),
                                            child: Icon(
                                              cardData['icon'] as IconData,
                                              color: isSelected
                                                  ? Luo3Colors.textPrimary
                                                  : Luo3Colors.inputBackground,
                                              size: 30,
                                            ),
                                          ),
                                          const SizedBox(height: 10),
                                          Text(
                                            cardData['title'] as String,
                                            style: GoogleFonts.inter(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w500,
                                              color: isSelected
                                                  ? Luo3Colors.inputBackground
                                                  : Luo3Colors.textPrimary,
                                            ),
                                          ),
                                          Text(
                                            cardData['subtitle'] as String,
                                            style: GoogleFonts.inter(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                              color: isSelected
                                                  ? Luo3Colors.inputBackground
                                                  : Luo3Colors.textPrimary,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                ],
                              );
                            }),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
