import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:luo3_app/components/booking_button.dart';
import 'package:luo3_app/components/rent_button.dart';
import 'package:luo3_app/theme/colors.dart';

class CompleteRentignCard extends StatefulWidget {
  const CompleteRentignCard({super.key});

  @override
  State<CompleteRentignCard> createState() => _CompleteRentignCardState();
}

class _CompleteRentignCardState extends State<CompleteRentignCard> {
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
                          'Completed',
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Luo3Colors.primary,
                          ),
                        ),
                        const SizedBox(width: 5),
                        const Icon(
                          Icons.check_circle,
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
                      Row(
                        children: [
                          Icon(Icons.social_distance,
                              color: Luo3Colors.primary),
                          SizedBox(width: 5),
                          Text(
                            '510 KM',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Luo3Colors.textPrimary,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.date_range, color: Luo3Colors.primary),
                          SizedBox(width: 5),
                          Text(
                            'Day 4',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Luo3Colors.textPrimary,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.attach_money, color: Luo3Colors.primary),
                          SizedBox(width: 5),
                          Text(
                            'Rs. 3000',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Luo3Colors.textPrimary,
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
                        'Date of Rent',
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
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Date of Rent End',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Luo3Colors.textSecondary,
                        ),
                      ),
                      Text(
                        'December 16, 2023',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Luo3Colors.textPrimary,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
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
                      'Renting is completed successfully. You can send feedback to the owner of the car.',
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
                        title: "Rent Again",
                        onPressed: () {
                          // Handle booking button tap
                        },
                      ),
                      const SizedBox(width: 10),
                      RentButton(
                          title: "Send Feedback",
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
}
