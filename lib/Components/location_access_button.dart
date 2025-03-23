import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:luo3_app/components/primary_button.dart';
import 'package:luo3_app/theme/colors.dart';

class LocationAccessButton extends StatefulWidget {
  final VoidCallback onPressed; // Store the function
  final String name;
  const LocationAccessButton(
      {super.key, required this.onPressed, required this.name});

  @override
  State<LocationAccessButton> createState() => _LocationAccessButtonState();
}

class _LocationAccessButtonState extends State<LocationAccessButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Luo3Colors.scaffoldColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
        boxShadow: [
          BoxShadow(
            // ignore: deprecated_member_use
            color: Colors.black.withOpacity(0.3),
            blurRadius: 15,
            spreadRadius: 3,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
            child: Column(
              children: [
                SizedBox(
                  height: 60,
                  width: double.infinity,
                  child: PrimaryButton(
                    title: widget.name,
                    onPressed: widget.onPressed, // Use the passed function
                  ),
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
                    "Maybe later",
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
        ],
      ),
    );
  }
}
