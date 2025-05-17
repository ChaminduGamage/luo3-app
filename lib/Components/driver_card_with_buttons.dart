import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:luo3_app/components/booking_button.dart';
import 'package:luo3_app/components/rent_button.dart';
import 'package:luo3_app/theme/colors.dart';

class DriverCardWithButtons extends StatefulWidget {
  const DriverCardWithButtons({super.key});

  @override
  State<DriverCardWithButtons> createState() => _DriverCardWithButtonsState();
}

bool _isBookmarked = false;

class _DriverCardWithButtonsState extends State<DriverCardWithButtons> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
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
                        IconButton(
                          icon: Icon(
                            _isBookmarked
                                ? Icons.bookmark
                                : Icons.bookmark_border,
                          ),
                          color: Luo3Colors.primary,
                          onPressed: () {
                            setState(() {
                              _isBookmarked = !_isBookmarked;
                            });
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        const Icon(Icons.location_on,
                            color: Luo3Colors.primary),
                        const SizedBox(width: 5),
                        Text(
                          'Location',
                          style: GoogleFonts.inter(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Luo3Colors.textPrimary,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        _specChip('Driving License'),
                        const SizedBox(width: 5),
                        _specChip('Experience'),
                        const SizedBox(width: 5),
                        _specChip('Vehicle Type'),
                      ],
                    ),
                    const SizedBox(height: 20),
                    TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        minimumSize: const Size(0, 0),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      child: Text(
                        "Download Medical Report",
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Luo3Colors.primary,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),

                    Divider(
                      // ignore: deprecated_member_use
                      color: Luo3Colors.textSecondary.withOpacity(0.2),
                      height: 30,
                    ),

                    // Overlapping review circles with add button
                    Align(
                      alignment: Alignment.centerLeft,
                      child: SizedBox(
                        height: 30,
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Positioned(
                              left: 0,
                              child: _circleReviewDot(),
                            ),
                            Positioned(
                              left: 12,
                              child: _circleReviewDot(),
                            ),
                            Positioned(
                              left: 24,
                              child: _circleReviewDot(),
                            ),
                            Positioned(
                              left: 36,
                              child: GestureDetector(
                                onTap: () {
                                  // Handle add button tap
                                },
                                child: _addCircleButton(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          '3 Reviews',
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Luo3Colors.textPrimary,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          'View All',
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Luo3Colors.primary,
                          ),
                        ),
                        const Spacer(),
                        Text.rich(
                          TextSpan(
                            text: 'Rs.3500',
                            style: GoogleFonts.inter(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Luo3Colors.primary,
                            ),
                            children: [
                              TextSpan(
                                text: '/per day',
                                style: GoogleFonts.inter(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                  color: Luo3Colors.textSecondary,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        BookingButton(
                          title: "Book Now",
                          onPressed: () {
                            // Handle booking button tap
                          },
                        ),
                        const SizedBox(width: 10),
                        RentButton(
                            title: "Hire Driver",
                            onPressed: () {
                              // Handle rent button tap
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

  Widget _specChip(String text) {
    return Container(
      height: 30,
      decoration: BoxDecoration(
        color: Luo3Colors.inputBackground,
        borderRadius: const BorderRadius.all(Radius.circular(4)),
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
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Center(
          child: Text(
            text,
            style: GoogleFonts.inter(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Luo3Colors.textPrimary,
            ),
          ),
        ),
      ),
    );
  }

  Widget _circleReviewDot() {
    return Container(
      width: 25,
      height: 25,
      decoration: BoxDecoration(
        color: Luo3Colors.checkBoxBorder,
        shape: BoxShape.circle,
        border: Border.all(
          color: Luo3Colors.background,
          width: 2,
        ),
      ),
    );
  }

  Widget _addCircleButton() {
    return Container(
      width: 25,
      height: 25,
      decoration: BoxDecoration(
        color: Luo3Colors.primary,
        shape: BoxShape.circle,
        border: Border.all(
          color: Luo3Colors.background,
          width: 2,
        ),
      ),
      child: const Icon(
        Icons.add,
        size: 16,
        color: Colors.white,
      ),
    );
  }
}
