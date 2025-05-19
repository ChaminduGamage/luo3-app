import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:luo3_app/theme/colors.dart';

class PrimaryButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed; // Add this parameter

  const PrimaryButton({
    super.key,
    required this.title,
    required this.onPressed, // Make it required
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed, // Use the passed function
      style: ElevatedButton.styleFrom(
        backgroundColor: Luo3Colors.primary,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
      ),
      child: Text(
        title,
        style: GoogleFonts.inter(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Luo3Colors.background,
        ),
      ),
    );
  }
}
