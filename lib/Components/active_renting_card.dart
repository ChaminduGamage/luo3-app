import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:luo3_app/components/booking_button.dart';
import 'package:luo3_app/components/rent_button.dart';
import 'package:luo3_app/theme/colors.dart';
import 'package:intl/intl.dart';

class ActiveRentingCard extends StatefulWidget {
  final Map<String, dynamic> request;
  const ActiveRentingCard({super.key, required this.request});

  @override
  State<ActiveRentingCard> createState() => _ActiveRentingCardState();
}

class _ActiveRentingCardState extends State<ActiveRentingCard> {
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
                      Text(
                        'For ${widget.request['days']} days',
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
                              widget.request['model'],
                              style: GoogleFonts.inter(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Luo3Colors.textPrimary,
                              ),
                            ),
                            Text(
                              widget.request['type'],
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
                                  text:
                                      'Rs.${widget.request['pricePerDay'].toString()}',
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
                            widget.request['vehicleNumber'],
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Row(
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
                      const Row(
                        children: [
                          Icon(Icons.date_range, color: Luo3Colors.primary),
                          SizedBox(width: 5),
                          Text(
                            'Day 1',
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
                          const Icon(Icons.attach_money,
                              color: Luo3Colors.primary),
                          const SizedBox(width: 5),
                          Text(
                            'Rs. ${widget.request['pricePerDay']}',
                            style: const TextStyle(
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Date of Rent:',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Luo3Colors.textSecondary,
                        ),
                      ),
                      Text(
                        DateFormat.yMMMMd()
                            .format(widget.request['requestedAt'].toDate()),
                        style: const TextStyle(
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
                      'Go to the owner’s house to the complete rental process.',
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
                          title: "Fnish Rent",
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
