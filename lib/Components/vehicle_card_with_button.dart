import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:luo3_app/components/buttons/bokking_button_for_card.dart';
import 'package:luo3_app/components/buttons/renting_button_for_map_card.dart';
import 'package:luo3_app/theme/colors.dart';

class VehicleCardWithButton extends StatefulWidget {
  final Map<String, dynamic> vehicle;
  final VoidCallback? onRentNow;
  const VehicleCardWithButton({
    super.key,
    required this.vehicle,
    this.onRentNow,
  });

  @override
  State<VehicleCardWithButton> createState() => _VehicleCardWithButtonState();
}

bool _isBookmarked = false;

class _VehicleCardWithButtonState extends State<VehicleCardWithButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
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
                              widget.vehicle['model'],
                              style: GoogleFonts.inter(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Luo3Colors.textPrimary,
                              ),
                            ),
                            Text(
                              widget.vehicle['type'],
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
                      const Icon(Icons.location_on, color: Luo3Colors.primary),
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
                      _specChip(widget.vehicle['fuelType']),
                      const SizedBox(width: 5),
                      _specChip(widget.vehicle['gearType']),
                      const SizedBox(width: 5),
                      _specChip('${widget.vehicle['noOfPassengers']}-Seats'),
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
                      "Download Vehicle Report",
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
                          text: widget.vehicle['pricePerDay'].toString(),
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
                      BookingButtonForMapCard(
                        title: "Book Vehicle",
                        onPressed: () {
                          // Handle booking button tap
                        },
                      ),
                      RentButtonForMapCard(
                          title: "Rent Now",
                          onPressed: widget.onRentNow ?? () {}),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
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
