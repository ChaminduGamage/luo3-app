import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:luo3_app/theme/colors.dart';

class VehicleOwnerHome extends StatefulWidget {
  const VehicleOwnerHome({super.key});

  @override
  State<VehicleOwnerHome> createState() => _VehicleOwnerHomeState();
}

class _VehicleOwnerHomeState extends State<VehicleOwnerHome> {
  bool isActive = true; // Place this in your StatefulWidget's state
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  color: Luo3Colors.inputBackground,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Row(
                        children: [
                          Icon(
                            Icons.person,
                            color: Luo3Colors.primary,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            height: 35,
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            decoration: BoxDecoration(
                              color: isActive
                                  ? Luo3Colors.primary
                                  : Luo3Colors.textSecondary,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Row(
                              children: [
                                Text(
                                  isActive ? 'Active' : 'Inactive',
                                  style: GoogleFonts.inter(
                                    fontSize:
                                        14, // Slightly smaller for compact toggle
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      isActive = !isActive;
                                    });
                                  },
                                  child: AnimatedContainer(
                                    duration: const Duration(milliseconds: 200),
                                    width: 40,
                                    height: 20,
                                    padding: const EdgeInsets.all(2),
                                    decoration: BoxDecoration(
                                      color: isActive
                                          ? Colors.white
                                          : Colors.grey.shade300,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: AnimatedAlign(
                                      duration:
                                          const Duration(milliseconds: 200),
                                      alignment: isActive
                                          ? Alignment.centerRight
                                          : Alignment.centerLeft,
                                      child: Container(
                                        width: 16,
                                        height: 16,
                                        decoration: BoxDecoration(
                                          color: isActive
                                              ? Luo3Colors.primary
                                              : Luo3Colors.textSecondary,
                                          borderRadius:
                                              BorderRadius.circular(100),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 170,
                    height: 80,
                    decoration: BoxDecoration(
                      color: Luo3Colors.inputBackground,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          // ignore: deprecated_member_use
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Luo3Colors.primary,
                          ),
                          height: 40,
                          width: 40,
                          child: const Icon(
                            Icons.calendar_month,
                            color: Luo3Colors.background,
                            size: 20,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Pre bookings',
                              style: GoogleFonts.inter(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Luo3Colors.textPrimary,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              '0',
                              style: GoogleFonts.inter(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Luo3Colors.textPrimary,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 170,
                    height: 80,
                    decoration: BoxDecoration(
                      color: Luo3Colors.inputBackground,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          // ignore: deprecated_member_use
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Luo3Colors.primary,
                          ),
                          height: 40,
                          width: 40,
                          child: const Icon(
                            Icons.attach_money,
                            color: Luo3Colors.background,
                            size: 20,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Toral Earnings',
                              style: GoogleFonts.inter(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Luo3Colors.textPrimary,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              '0',
                              style: GoogleFonts.inter(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Luo3Colors.textPrimary,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
