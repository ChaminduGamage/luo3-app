import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:luo3_app/Theme/colors.dart';
import 'package:luo3_app/components/vehicle_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isDrinkingModeOn = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 210,
                decoration: const BoxDecoration(
                  color: Luo3Colors.primary,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 20,
                        left: 20,
                        right: 20,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Drinking Mode',
                            style: GoogleFonts.inter(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Luo3Colors.inputBackground,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isDrinkingModeOn = !isDrinkingModeOn;
                              });
                            },
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 200),
                              width: 40, // Reverted to previous width
                              height: 20, // Reverted to previous height
                              decoration: BoxDecoration(
                                color: isDrinkingModeOn
                                    ? Luo3Colors.accent
                                    : Luo3Colors.textSecondary, // Track color
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                    color: Luo3Colors.inputBackground,
                                    width: 2), // Border color & width
                              ),
                              child: Stack(
                                alignment: Alignment.centerLeft,
                                children: [
                                  AnimatedPositioned(
                                    duration: const Duration(milliseconds: 200),
                                    left: isDrinkingModeOn
                                        ? 21
                                        : 3, // Adjusted positioning slightly to avoid touching border
                                    child: Container(
                                      width: 14, // Reverted thumb size
                                      height: 14,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Luo3Colors
                                            .inputBackground, // Thumb color
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
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          Text(
                            'Location',
                            style: GoogleFonts.inter(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Luo3Colors.inputBackground,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                  color: Luo3Colors.inputBackground,
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: const Icon(
                                  Icons.location_on,
                                  color: Luo3Colors.primary,
                                ),
                              ),
                              const SizedBox(width: 10),
                              Text(
                                'Your Location',
                                style: GoogleFonts.inter(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Luo3Colors.inputBackground,
                                ),
                              ),
                              const SizedBox(
                                width: 30,
                                height: 30,
                                child: Icon(
                                  Icons.arrow_drop_down,
                                  color: Luo3Colors.inputBackground,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              color: Luo3Colors.inputBackground,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: const Icon(
                              Icons.notification_important,
                              color: Luo3Colors.primary,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              // ignore: avoid_print
                              print('Tapped');
                            },
                            child: Container(
                              width: 300,
                              height: 45,
                              decoration: BoxDecoration(
                                color: Luo3Colors.inputBackground,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                children: [
                                  const SizedBox(width: 10),
                                  const Icon(
                                    Icons.search,
                                    color: Luo3Colors.textSecondary,
                                  ),
                                  const SizedBox(width: 10),
                                  Text(
                                    'Search for a drink',
                                    style: GoogleFonts.inter(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: Luo3Colors.textSecondary,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              // ignore: avoid_print
                              print('Tapped');
                            },
                            child: Container(
                              width: 45,
                              height: 45,
                              decoration: BoxDecoration(
                                color: Luo3Colors.accent,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Icon(
                                Icons.filter_list,
                                color: Luo3Colors.textPrimary,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Suggested Types',
                      style: GoogleFonts.inter(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Luo3Colors.textPrimary,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        minimumSize: const Size(0, 0),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      child: Text(
                        "See All",
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Luo3Colors.primary,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const VehicleCard(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Recently Rented',
                      style: GoogleFonts.inter(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Luo3Colors.textPrimary,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        minimumSize: const Size(0, 0),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      child: Text(
                        "See All",
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Luo3Colors.primary,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const VehicleCard(),
            ],
          ),
        ),
      ),
    );
  }
}
