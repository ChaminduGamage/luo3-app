import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:luo3_app/components/vehicle_card_with_button.dart';
import 'package:luo3_app/theme/colors.dart';

class ClickVehicles extends StatefulWidget {
  const ClickVehicles({super.key});

  @override
  State<ClickVehicles> createState() => _ClickVehiclesState();
}

class _ClickVehiclesState extends State<ClickVehicles> {
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
            const VehicleCardWithButton(),
          ],
        ),
      ),
    );
  }
}
