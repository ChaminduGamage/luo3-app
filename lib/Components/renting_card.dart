import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:luo3_app/components/booking_button.dart';
import 'package:luo3_app/components/rent_button.dart';
import 'package:luo3_app/pages/renter/rent_requesting_page.dart';
import 'package:luo3_app/theme/colors.dart';

class RentingCard extends StatefulWidget {
  final Map<String, dynamic> vehicle;
  const RentingCard({
    super.key,
    required this.vehicle,
  });

  @override
  State<RentingCard> createState() => _RentingCardState();
}

class _RentingCardState extends State<RentingCard> {
  String? _selectedRentalDays;
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Reach out to vehicle',
                        style: GoogleFonts.inter(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Luo3Colors.textPrimary,
                        ),
                      ),
                      Text(
                        '5 Mins Away',
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
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            children: [
                              Text.rich(
                                TextSpan(
                                  text:
                                      widget.vehicle['pricePerDay'].toString(),
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
                            widget.vehicle['vehicleNumber'],
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
                      'How long are you renting or hiring?',
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
                      BookingButton(
                        title: "Cancel",
                        onPressed: () {
                          // Handle booking button tap
                        },
                      ),
                      const SizedBox(width: 10),
                      RentButton(
                          title: "Request Rent",
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RentRequestingPage(
                                      vehicleData: widget.vehicle,
                                      days: _selectedRentalDays)),
                            );
                          }),
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
