import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:luo3_app/components/buttons/bokking_button_for_card.dart';
import 'package:luo3_app/components/buttons/renting_button_for_map_card.dart';
import 'package:luo3_app/theme/colors.dart';

class DriverHireCard extends StatefulWidget {
  final Map<String, dynamic> driver;
  const DriverHireCard({super.key, required this.driver});

  @override
  State<DriverHireCard> createState() => _DriverHireCardState();
}

class _DriverHireCardState extends State<DriverHireCard> {
  String? _selectedRentalDays;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Hire a Driver',
                          style: GoogleFonts.inter(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Luo3Colors.textPrimary,
                          ),
                        ),
                        Text(
                          'Experience',
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Luo3Colors.primary,
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      // ignore: deprecated_member_use
                      color: Luo3Colors.textSecondary.withOpacity(0.2),
                      height: 30,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 60,
                          height: 60,
                          margin: const EdgeInsets.only(right: 16),
                          decoration: BoxDecoration(
                            color: Luo3Colors.textSecondary,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            boxShadow: [
                              BoxShadow(
                                // ignore: deprecated_member_use
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 12,
                                offset: const Offset(0, 6),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Driver Name',
                                style: GoogleFonts.inter(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Luo3Colors.textPrimary,
                                ),
                              ),
                              Text(
                                'Driver ID',
                                style: GoogleFonts.inter(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Luo3Colors.textSecondary,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              children: [
                                Text.rich(
                                  TextSpan(
                                    text: 'Rs.3500',
                                    style: GoogleFonts.inter(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      color: Luo3Colors.primary,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: '/per day',
                                        style: GoogleFonts.inter(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: Luo3Colors.textSecondary,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              'Driver Rating: 4.5',
                              style: GoogleFonts.inter(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Luo3Colors.primary,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'How many days do you want to hire the driver?',
                        style: GoogleFonts.inter(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Luo3Colors.textPrimary,
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: List.generate(7, (index) {
                              final int days = index + 1;
                              return _rentalDaysOption(days);
                            })
                              ..add(
                                _rentalDaysOptionOther(),
                              ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        BookingButtonForMapCard(
                          title: "Cancel",
                          onPressed: () {
                            // Handle booking button tap
                          },
                        ),
                        RentButtonForMapCard(
                            title: "Hire Driver",
                            onPressed: () async {
                              try {
                                // 1. Get the driver ID
                                final driverId = widget.driver['userId'];

                                // 2. Update Firestore (or your database)
                                await FirebaseFirestore.instance
                                    .collection('drivers')
                                    .doc(driverId)
                                    .update({'isBooked': true});

                                // 3. Close the modal
                                Navigator.pop(context);
                              } catch (e) {
                                // Optional: handle error (e.g., show Snackbar or Alert)
                                print("Error updating booking status: $e");
                              }
                            }),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _rentalDaysOption(int days) {
    final bool isSelected = _selectedRentalDays == '$days';

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedRentalDays = '$days';
        });
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 10, bottom: 10, top: 10),
        child: Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: isSelected ? Luo3Colors.primary : Luo3Colors.inputBackground,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 12,
                offset: const Offset(0, 1),
              ),
            ],
          ),
          child: Center(
            child: Text(
              '$days',
              style: GoogleFonts.inter(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: isSelected ? Colors.white : Luo3Colors.textSecondary,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _rentalDaysOptionOther() {
    final bool isSelected = _selectedRentalDays == 'Other';

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedRentalDays = 'Other';
        });
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 10),
        child: Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: isSelected ? Luo3Colors.primary : Luo3Colors.inputBackground,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 12,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: Center(
            child: Text(
              'Other',
              style: GoogleFonts.inter(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: isSelected ? Colors.white : Luo3Colors.textSecondary,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
