import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:luo3_app/components/booking_button.dart';
import 'package:luo3_app/components/rent_button.dart';
import 'package:luo3_app/theme/colors.dart';

class BookingRentingCard extends StatefulWidget {
  const BookingRentingCard({super.key});

  @override
  State<BookingRentingCard> createState() => _BookingRentingCardState();
}

class _BookingRentingCardState extends State<BookingRentingCard> {
  String? _selectedRentalDays;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Luo3Colors.inputBackground,
              borderRadius: const BorderRadius.all(Radius.circular(15)),
              boxShadow: [
                BoxShadow(
                  // ignore: deprecated_member_use
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 12,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Info About Renting',
                        style: GoogleFonts.inter(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Luo3Colors.textPrimary,
                        ),
                      ),
                      Row(children: [
                        Text(
                          'Booking',
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Luo3Colors.primary,
                          ),
                        ),
                        const SizedBox(width: 5),
                        const Icon(
                          Icons.calendar_month,
                          color: Luo3Colors.primary,
                          size: 16,
                        ),
                      ]),
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
                              'Toyota Premio',
                              style: GoogleFonts.inter(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Luo3Colors.textPrimary,
                              ),
                            ),
                            Text(
                              'Comfort Sedan',
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
                                  text: 'Rs.3000',
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
                            'GR 6456',
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
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Date of Booking',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Luo3Colors.textSecondary,
                        ),
                      ),
                      Text(
                        'December 12, 2023',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Luo3Colors.textPrimary,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'If you want to extend the rental period?',
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
                  const SizedBox(height: 10),
                  RichText(
                    text: TextSpan(
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                      children: const [
                        TextSpan(
                          text: 'Note:\n',
                          style: TextStyle(
                            color: Luo3Colors.primary,
                          ),
                        ),
                        TextSpan(
                          text:
                              'Only 150 Km is given free per day charge. Rs 100 will be charged in addition to extra 1 Km',
                          style: TextStyle(
                            color: Luo3Colors.textSecondary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                      'Check the car before renting it. If you find any damage, please report it to the owner.',
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Luo3Colors.primary,
                      )),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BookingButton(
                        title: "Chat with Owner",
                        onPressed: () {
                          // Handle booking button tap
                        },
                      ),
                      const SizedBox(width: 10),
                      RentButton(
                          title: "Cancel Booking",
                          onPressed: () {
                            // Handle rent button tap
                          }),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
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
