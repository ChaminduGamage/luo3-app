import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:luo3_app/components/secondary_button.dart';

import 'package:luo3_app/pages/vehicle%20owner/owner_profile.dart';
import 'package:luo3_app/theme/colors.dart';

class VehicleOwnerHome extends StatefulWidget {
  const VehicleOwnerHome({super.key});

  @override
  State<VehicleOwnerHome> createState() => _VehicleOwnerHomeState();
}

class _VehicleOwnerHomeState extends State<VehicleOwnerHome> {
  bool isActive = true;

  GoogleMapController? _mapController;

  @override
  void initState() {
    super.initState();
    _focusCurrentLocation(); // Call on init
  }

  void _onMapCreated(GoogleMapController controller) async {
    _mapController = controller;
    String style =
        await rootBundle.loadString('assets/map_styles/light_map_style.json');
    _mapController?.setMapStyle(style);
    _focusCurrentLocation();
  }

  Future<void> _focusCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Check if location services are enabled
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      print('Location services are disabled.');
      return;
    }

    // Check permission
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        print('Location permission denied');
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      print('Location permission permanently denied');
      return;
    }

    // Get current position
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    // Move camera
    _mapController?.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(
        target: LatLng(position.latitude, position.longitude),
        zoom: 13,
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            // Expanded Fullscreen Google Map
            Positioned.fill(
              child: GoogleMap(
                onMapCreated: _onMapCreated,
                initialCameraPosition: const CameraPosition(
                  target: LatLng(6.9271, 79.8612), // Colombo
                  zoom: 13,
                ),
                myLocationEnabled: true,
                myLocationButtonEnabled: true,
                mapType: MapType.normal,
              ),
            ),

            // Foreground UI over the Map
            Column(
              children: [
                // Top Bar with Profile Icon and Toggle
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Luo3Colors.inputBackground,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Profile Icon Button
                          IconButton(
                            icon: const Icon(
                              Icons.person,
                              color: Luo3Colors.primary,
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => OwnerProfilePage(),
                                ),
                              );
                            },
                          ),

                          // Active/Inactive Toggle
                          Container(
                            height: 35,
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            decoration: BoxDecoration(
                              color: isActive
                                  ? Luo3Colors.primary
                                  : Luo3Colors.textSecondary,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Row(
                              children: [
                                Text(
                                  isActive ? 'Active' : 'Inactive',
                                  style: GoogleFonts.inter(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      isActive = !isActive;
                                    });
                                  },
                                  child: AnimatedContainer(
                                    duration: const Duration(milliseconds: 200),
                                    width: 40,
                                    height: 20,
                                    padding: const EdgeInsets.all(2),
                                    decoration: BoxDecoration(
                                      color: isActive
                                          ? Colors.white
                                          : Colors.grey.shade300,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: AnimatedAlign(
                                      duration:
                                          const Duration(milliseconds: 200),
                                      alignment: isActive
                                          ? Alignment.centerRight
                                          : Alignment.centerLeft,
                                      child: Container(
                                        width: 16,
                                        height: 16,
                                        decoration: BoxDecoration(
                                          color: isActive
                                              ? Luo3Colors.primary
                                              : Luo3Colors.textSecondary,
                                          borderRadius:
                                              BorderRadius.circular(100),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),

                // Stat Cards
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Pre Bookings
                      Container(
                        width: 170,
                        height: 80,
                        decoration: BoxDecoration(
                          color: Luo3Colors.inputBackground,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.05),
                              blurRadius: 8,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Luo3Colors.primary,
                              ),
                              height: 40,
                              width: 40,
                              child: const Icon(
                                Icons.calendar_month,
                                color: Luo3Colors.background,
                                size: 20,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Pre bookings',
                                  style: GoogleFonts.inter(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Luo3Colors.textPrimary,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  '0',
                                  style: GoogleFonts.inter(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Luo3Colors.textPrimary,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      // Total Earnings
                      Container(
                        width: 170,
                        height: 80,
                        decoration: BoxDecoration(
                          color: Luo3Colors.inputBackground,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.05),
                              blurRadius: 8,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Luo3Colors.primary,
                              ),
                              height: 40,
                              width: 40,
                              child: const Icon(
                                Icons.attach_money,
                                color: Luo3Colors.background,
                                size: 20,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Total Earnings',
                                  style: GoogleFonts.inter(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Luo3Colors.textPrimary,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  '0',
                                  style: GoogleFonts.inter(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Luo3Colors.textPrimary,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                const Spacer(),

                // Vehicle List Button
                SizedBox(
                  width: double.infinity,
                  child: SecondaryButton(
                    name: "Vehicle List",
                    onPressed: () {
                      Navigator.pushNamed(context, '/vehicle-list');
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
