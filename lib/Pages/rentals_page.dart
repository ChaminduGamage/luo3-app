import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:luo3_app/components/active_renting_card.dart';
import 'package:luo3_app/components/booking_renting_card.dart';
import 'package:luo3_app/components/complete_renting_card.dart';
import 'package:luo3_app/theme/colors.dart';

class RentalsPage extends StatefulWidget {
  const RentalsPage({super.key});

  @override
  State<RentalsPage> createState() => _RentalsPageState();
}

class _RentalsPageState extends State<RentalsPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacementNamed(
                              context, '/default-home');
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
                      const SizedBox(width: 100),
                      Text(
                        'Rentals',
                        style: GoogleFonts.inter(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                          color: Luo3Colors.textPrimary,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),

            /// Tabs Section
            Expanded(
              child: DefaultTabController(
                length: 3,
                child: Column(
                  children: [
                    TabBar(
                      labelStyle: GoogleFonts.inter(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                      unselectedLabelStyle: GoogleFonts.inter(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                      unselectedLabelColor: Colors.grey,
                      labelColor: Luo3Colors.primary,

                      // KEEP your primary color underline
                      indicatorColor: Luo3Colors.primary,

                      // 👇 Add this to remove the gray border line
                      indicator: const UnderlineTabIndicator(
                        borderSide:
                            BorderSide(width: 3.0, color: Luo3Colors.primary),
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(10),
                        ),
                      ),
                      // ignore: deprecated_member_use
                      overlayColor: MaterialStateProperty.all(Colors
                          .transparent), // optional: removes ripple effect background
                      dividerColor: Colors
                          .transparent, // 👈 this removes the gray divider under the tab bar

                      tabs: const [
                        Tab(text: 'Active'),
                        Tab(text: 'Completed'),
                        Tab(text: 'Booking'),
                      ],
                    ),
                    const SizedBox(height: 10),
                    const Expanded(
                      child: TabBarView(
                        children: [
                          Center(
                            child: ActiveRentingCard(),
                          ),
                          Center(
                            child: CompleteRentignCard(),
                          ),
                          Center(
                            child: BookingRentingCard(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
