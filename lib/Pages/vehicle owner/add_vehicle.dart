import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:luo3_app/components/buttons/secondary_button.dart';
import 'package:luo3_app/services/auth_services.dart';
import 'package:luo3_app/theme/colors.dart';

class AddVehiclePage extends StatefulWidget {
  const AddVehiclePage({super.key});

  @override
  State<AddVehiclePage> createState() => _AddVehiclePageState();
}

class _AddVehiclePageState extends State<AddVehiclePage> {
  final AuthServices _auth = AuthServices();
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _modelController = TextEditingController();
  final TextEditingController _typeController = TextEditingController();
  final TextEditingController _noPassengerController = TextEditingController();
  final TextEditingController _vehicleNumberController =
      TextEditingController();
  final TextEditingController _gearController = TextEditingController();
  final TextEditingController _fuelController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _freeKilometerController =
      TextEditingController();
  final TextEditingController _additionalPriceController =
      TextEditingController();

  bool? isChecked = false;

  @override
  void dispose() {
    _modelController.dispose();
    _typeController.dispose();
    _noPassengerController.dispose();
    _vehicleNumberController.dispose();
    _gearController.dispose();
    _fuelController.dispose();
    _priceController.dispose();
    _freeKilometerController.dispose();
    super.dispose();
  }

  Future<Position?> _getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      print('Location services are disabled.');
      return null;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        print('Location permissions are denied.');
        return null;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      print('Location permissions are permanently denied.');
      return null;
    }

    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacementNamed(
                              context, '/vehicle-list');
                        },
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(
                              color: Luo3Colors.textPrimary,
                              width: 2,
                            ),
                          ),
                          child: const Icon(
                            Icons.arrow_back,
                            color: Luo3Colors.textPrimary,
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Add Vehicle Details',
                          style: GoogleFonts.inter(
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                            color: Luo3Colors.textPrimary,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Text(
                          "Please fill in the details below to add your vehicle. This information will help us to better serve you.",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.inter(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Luo3Colors.textSecondary,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Align(
                        alignment: Alignment.center,
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: const Icon(
                                Icons.person,
                                color: Luo3Colors.primary,
                                size: 40,
                              ),
                            ),
                            Positioned(
                              right: -10,
                              bottom: -5,
                              child: Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: const Icon(
                                  Icons.add_a_photo,
                                  color: Luo3Colors.primary,
                                  size: 15,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 40),
                      Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Vehicle Model",
                              style: GoogleFonts.inter(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Luo3Colors.textPrimary,
                              ),
                            ),
                            const SizedBox(height: 8),
                            TextFormField(
                              controller: _modelController,
                              keyboardType: TextInputType.text,
                              decoration:
                                  _inputDecoration("Example: Toyota Premio"),
                              validator: (value) => value!.isEmpty
                                  ? 'Please enter your vehicle model'
                                  : null,
                            ),
                            const SizedBox(height: 15),
                            Text(
                              "Vehicle Type",
                              style: GoogleFonts.inter(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Luo3Colors.textPrimary,
                              ),
                            ),
                            const SizedBox(height: 8),
                            TextFormField(
                              controller: _typeController,
                              keyboardType: TextInputType.text,
                              decoration:
                                  _inputDecoration("Example: SUV, Sedan, etc."),
                              validator: (value) => value!.isEmpty
                                  ? 'Please enter your vehicle type'
                                  : null,
                            ),
                            const SizedBox(height: 15),
                            Text(
                              "Vehicle Number",
                              style: GoogleFonts.inter(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Luo3Colors.textPrimary,
                              ),
                            ),
                            const SizedBox(height: 8),
                            TextFormField(
                              controller: _vehicleNumberController,
                              keyboardType: TextInputType.text,
                              decoration: _inputDecoration("Example: KBC 123A"),
                              maxLength: 7,
                              validator: (value) => value!.isEmpty
                                  ? 'Please enter the vehicle number'
                                  : null,
                            ),
                            const SizedBox(height: 15),
                            Text(
                              "No. of Passengers",
                              style: GoogleFonts.inter(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Luo3Colors.textPrimary,
                              ),
                            ),
                            const SizedBox(height: 8),
                            TextFormField(
                              controller: _noPassengerController,
                              keyboardType: TextInputType.number,
                              decoration:
                                  _inputDecoration("Example: 4, 5, 7, etc."),
                              validator: (value) => value!.isEmpty
                                  ? 'Please enter the number of passengers'
                                  : null,
                            ),
                            const SizedBox(height: 15),
                            Text(
                              "Gear Type",
                              style: GoogleFonts.inter(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Luo3Colors.textPrimary,
                              ),
                            ),
                            const SizedBox(height: 8),
                            TextFormField(
                              controller: _gearController,
                              keyboardType: TextInputType.text,
                              decoration:
                                  _inputDecoration("Manual / Automatic"),
                              validator: (value) => value!.isEmpty
                                  ? 'Please enter the gear type'
                                  : null,
                            ),
                            const SizedBox(height: 15),
                            Text(
                              "Fuel Type",
                              style: GoogleFonts.inter(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Luo3Colors.textPrimary,
                              ),
                            ),
                            const SizedBox(height: 8),
                            TextFormField(
                              controller: _fuelController,
                              keyboardType: TextInputType.text,
                              decoration: _inputDecoration(
                                  "Petrol / Diesel / Electric"),
                              validator: (value) => value!.isEmpty
                                  ? 'Please enter the fuel type'
                                  : null,
                            ),
                            const SizedBox(height: 30),
                            Text(
                              "Price per Day",
                              style: GoogleFonts.inter(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Luo3Colors.textPrimary,
                              ),
                            ),
                            const SizedBox(height: 8),
                            TextFormField(
                              controller: _priceController,
                              keyboardType: TextInputType.number,
                              decoration:
                                  _inputDecoration("Example: 1000, 1500, etc."),
                              validator: (value) => value!.isEmpty
                                  ? 'Please enter the price per day'
                                  : null,
                            ),
                            const SizedBox(height: 15),
                            Text(
                              "Free Kilometers",
                              style: GoogleFonts.inter(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Luo3Colors.textPrimary,
                              ),
                            ),
                            const SizedBox(height: 8),
                            TextFormField(
                              controller: _freeKilometerController,
                              keyboardType: TextInputType.number,
                              decoration: _inputDecoration(
                                  "Example: 100 KM,200 KM, etc."),
                              validator: (value) => value!.isEmpty
                                  ? 'Please enter the price per day'
                                  : null,
                            ),
                            const SizedBox(height: 15),
                            Text(
                              "Additional price per kilometer",
                              style: GoogleFonts.inter(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Luo3Colors.textPrimary,
                              ),
                            ),
                            const SizedBox(height: 8),
                            TextFormField(
                              controller: _additionalPriceController,
                              keyboardType: TextInputType.number,
                              decoration:
                                  _inputDecoration("Example: 1000, 1500, etc."),
                              validator: (value) => value!.isEmpty
                                  ? 'Please enter the additional price per kilometer'
                                  : null,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: SecondaryButton(
                name: "Add Vehicle",
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    try {
                      final uid = _auth.getUid();

                      if (uid == null) {
                        print("User not logged in.");
                        return;
                      }

                      final position = await _getCurrentLocation();
                      if (position == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text("Location not available.")),
                        );
                        return;
                      }

                      await FirebaseFirestore.instance
                          .collection('vehicles')
                          .add({
                        'uid': uid,
                        'model': _modelController.text.trim(),
                        'type': _typeController.text.trim(),
                        'vehicleNumber': _vehicleNumberController.text.trim(),
                        'noOfPassengers':
                            int.tryParse(_noPassengerController.text.trim()) ??
                                0,
                        'gearType': _gearController.text.trim(),
                        'fuelType': _fuelController.text.trim(),
                        'pricePerDay':
                            double.tryParse(_priceController.text.trim()) ?? 0,
                        'freeKilometers': _freeKilometerController.text.trim(),
                        'additionalPricePerKm': double.tryParse(
                                _additionalPriceController.text.trim()) ??
                            0,
                        'createdAt': FieldValue.serverTimestamp(),
                        'location': {
                          'latitude': position.latitude,
                          'longitude': position.longitude,
                        }
                      });

                      print("Vehicle added successfully.");
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text("Vehicle added successfully!")),
                      );
                      Navigator.pushNamed(context, '/vehicle-list');
                    } catch (e) {
                      print("Error adding vehicle: $e");
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Failed to add vehicle.")),
                      );
                    }
                  } else {
                    print("Form validation failed.");
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  InputDecoration _inputDecoration(String hintText) {
    return InputDecoration(
      filled: true,
      fillColor: Luo3Colors.checkBoxBorder,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Luo3Colors.checkBoxBorder),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Luo3Colors.primary, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Colors.red),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Colors.red, width: 2),
      ),
      hintText: hintText,
    );
  }
}
