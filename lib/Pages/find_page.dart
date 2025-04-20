import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:luo3_app/theme/colors.dart';

class FindPage extends StatefulWidget {
  const FindPage({super.key});

  @override
  State<FindPage> createState() => _FindPageState();
}

class _FindPageState extends State<FindPage> {
  int? selectedCardIndex;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
                        boxShadow: [
                          BoxShadow(
                            // ignore: deprecated_member_use
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 12,
                            offset: const Offset(0, 6),
                          ),
                        ],
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
                            'Current Location',
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
                        boxShadow: [
                          BoxShadow(
                            // ignore: deprecated_member_use
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 12,
                            offset: const Offset(0, 6),
                          ),
                        ],
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
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Container(
                width: double.infinity,
                height: 225,
                decoration: BoxDecoration(
                  color: Luo3Colors.inputBackground,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      // ignore: deprecated_member_use
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 12.0,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 16.0,
                        top: 16.0,
                        bottom: 12.0,
                      ),
                      child: Text(
                        'What you need?',
                        style: GoogleFonts.inter(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Luo3Colors.textPrimary,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8.0,
                            vertical: 8.0,
                          ),
                          child: Row(
                            children: List.generate(4, (index) {
                              final isSelected = selectedCardIndex == index;
                              final cardData = [
                                {
                                  'icon': Icons.car_rental,
                                  'title': 'P2P Rental',
                                  'subtitle': 'Search your rental',
                                },
                                {
                                  'icon': Icons.drive_eta,
                                  'title': 'Drivers',
                                  'subtitle': 'Search your drivers',
                                },
                                {
                                  'icon': Icons.business,
                                  'title': 'Rentals Agency',
                                  'subtitle': 'Search your Agency',
                                },
                                {
                                  'icon': Icons.car_repair,
                                  'title': 'Repair Shops',
                                  'subtitle': 'Search repair shops',
                                },
                              ][index];

                              return Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        selectedCardIndex = index;
                                      });
                                      // ignore: avoid_print
                                      print('Tapped card index $index');
                                    },
                                    child: Container(
                                      width: 145,
                                      height: 150,
                                      decoration: BoxDecoration(
                                        color: isSelected
                                            ? Luo3Colors.primary
                                            : Luo3Colors.inputBackground,
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: [
                                          BoxShadow(
                                            // ignore: deprecated_member_use
                                            color:
                                                // ignore: deprecated_member_use
                                                Colors.black.withOpacity(0.1),
                                            blurRadius: 12,
                                            offset: const Offset(0, 1),
                                          ),
                                        ],
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: 50,
                                            height: 50,
                                            decoration: BoxDecoration(
                                              color: isSelected
                                                  ? Luo3Colors.inputBackground
                                                  : Luo3Colors.textPrimary,
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                            ),
                                            child: Icon(
                                              cardData['icon'] as IconData,
                                              color: isSelected
                                                  ? Luo3Colors.textPrimary
                                                  : Luo3Colors.inputBackground,
                                              size: 30,
                                            ),
                                          ),
                                          const SizedBox(height: 10),
                                          Text(
                                            cardData['title'] as String,
                                            style: GoogleFonts.inter(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w500,
                                              color: isSelected
                                                  ? Luo3Colors.inputBackground
                                                  : Luo3Colors.textPrimary,
                                            ),
                                          ),
                                          Text(
                                            cardData['subtitle'] as String,
                                            style: GoogleFonts.inter(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                              color: isSelected
                                                  ? Luo3Colors.inputBackground
                                                  : Luo3Colors.textPrimary,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                ],
                              );
                            }),
                          ),
                        ),
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
