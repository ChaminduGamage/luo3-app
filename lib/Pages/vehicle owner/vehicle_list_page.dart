import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:luo3_app/services/auth_services.dart';
import 'package:luo3_app/theme/colors.dart';

class VehicleListPage extends StatefulWidget {
  const VehicleListPage({super.key});

  @override
  State<VehicleListPage> createState() => _VehicleListPageState();
}

class _VehicleListPageState extends State<VehicleListPage> {
  AuthServices _auth = AuthServices();
  List<Map<String, dynamic>> vehicles = [];

  Future<void> fetchVehicles() async {
    try {
      final uid = _auth.getUid();

      final querySnapshot = await FirebaseFirestore.instance
          .collection('vehicles')
          .where('uid', isEqualTo: uid) // 🔍 filter by current user's UID
          .get();

      final allVehicles = querySnapshot.docs.map((doc) {
        return {
          'id': doc.id,
          ...doc.data(),
        };
      }).toList();

      setState(() {
        vehicles = allVehicles;
      });
    } catch (e) {
      print('Error fetching vehicles: $e');
      // Handle error, maybe show a snackbar or message
    }
  }

  @override
  void initState() {
    super.initState();
    fetchVehicles(); // Fetch vehicles when widget initializes
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacementNamed(
                            context, '/vehicle-owner-home');
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
                        child: const Icon(Icons.arrow_back,
                            color: Luo3Colors.textPrimary),
                      ),
                    ),
                    const SizedBox(width: 75),
                    Text(
                      'Your Vehicles',
                      style: GoogleFonts.inter(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        color: Luo3Colors.textPrimary,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    ...vehicles.map((vehicle) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: Container(
                          width: double.infinity,
                          height: 100,
                          decoration: BoxDecoration(
                            color: Luo3Colors.inputBackground,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(15)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 12,
                                offset: const Offset(0, 6),
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: Center(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 60,
                                    height: 60,
                                    margin: const EdgeInsets.only(right: 16),
                                    decoration: BoxDecoration(
                                      color: Luo3Colors.textSecondary,
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(10)),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.1),
                                          blurRadius: 12,
                                          offset: const Offset(0, 6),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          vehicle['model'],
                                          style: GoogleFonts.inter(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            color: Luo3Colors.textPrimary,
                                          ),
                                        ),
                                        Text(
                                          vehicle['type'],
                                          style: GoogleFonts.inter(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: Luo3Colors.textSecondary,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    height: 45,
                                    width: 45,
                                    margin: const EdgeInsets.all(16.0),
                                    decoration: BoxDecoration(
                                      color: Luo3Colors.inputBackground,
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(50)),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.1),
                                          blurRadius: 12,
                                          offset: const Offset(0, 6),
                                        ),
                                      ],
                                    ),
                                    child: IconButton(
                                        icon: const Icon(Icons.delete),
                                        color: Colors.red,
                                        onPressed: () {
                                          showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                title: const Text(
                                                    "Delete Vehicle"),
                                                content: const Text(
                                                    "Are you sure you want to delete this vehicle?"),
                                                actions: [
                                                  TextButton(
                                                    child: const Text("Cancel"),
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop(); // Close dialog
                                                    },
                                                  ),
                                                  TextButton(
                                                    child: const Text("Delete"),
                                                    onPressed: () async {
                                                      // Remove vehicle from list
                                                      await FirebaseFirestore
                                                          .instance
                                                          .collection(
                                                              'vehicles')
                                                          .doc(vehicle['id'])
                                                          .delete();

                                                      // Re-fetch vehicles
                                                      fetchVehicles();

                                                      Navigator.of(context)
                                                          .pop(); // Close dialog
                                                    },
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                        }),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                    const SizedBox(height: 10),
                    DottedBorder(
                      color: Luo3Colors.primary,
                      strokeWidth: 1.5,
                      dashPattern: const [6, 4],
                      borderType: BorderType.RRect,
                      radius: const Radius.circular(15),
                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, '/add-vehicle');
                        },
                        child: Container(
                          width: double.infinity,
                          height: 80,
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.add,
                                color: Luo3Colors.primary,
                                size: 24,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                'Add New Vehicle',
                                style: GoogleFonts.inter(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Luo3Colors.primary,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'FAQs & Support',
                        style: GoogleFonts.inter(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Luo3Colors.textPrimary,
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    Container(
                      decoration: BoxDecoration(
                        color: Luo3Colors.inputBackground,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 8,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Theme(
                        data: Theme.of(context).copyWith(
                          dividerColor:
                              Colors.transparent, // Removes default dividers
                        ),
                        child: ExpansionTile(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                            side: BorderSide.none,
                          ),
                          collapsedShape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                            side: BorderSide.none,
                          ),
                          title: Text(
                            'Can I rent out more than one vehicle?',
                            style: GoogleFonts.inter(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Luo3Colors.textPrimary,
                            ),
                          ),
                          tilePadding:
                              const EdgeInsets.symmetric(horizontal: 16),
                          collapsedIconColor: Luo3Colors.primary,
                          iconColor: Luo3Colors.primary,
                          childrenPadding: const EdgeInsets.only(bottom: 8),
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 8),
                              child: Text(
                                'Yes, you can register and rent out multiple vehicles under the same account. Each vehicle will have its own profile, settings, and rental status.',
                                style: GoogleFonts.inter(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Luo3Colors.textSecondary,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      decoration: BoxDecoration(
                        color: Luo3Colors.inputBackground,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 8,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Theme(
                        data: Theme.of(context).copyWith(
                          dividerColor:
                              Colors.transparent, // Removes default dividers
                        ),
                        child: ExpansionTile(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                            side: BorderSide.none,
                          ),
                          collapsedShape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                            side: BorderSide.none,
                          ),
                          title: Text(
                            'What documents are required to list my vehicle?',
                            style: GoogleFonts.inter(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Luo3Colors.textPrimary,
                            ),
                          ),
                          tilePadding:
                              const EdgeInsets.symmetric(horizontal: 16),
                          collapsedIconColor: Luo3Colors.primary,
                          iconColor: Luo3Colors.primary,
                          childrenPadding: const EdgeInsets.only(bottom: 8),
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 8),
                              child: Text(
                                'You need to upload your vehicle registration, insurance details, and a recent emission test certificate. These documents ensure trust and safety for renters.',
                                style: GoogleFonts.inter(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Luo3Colors.textSecondary,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
