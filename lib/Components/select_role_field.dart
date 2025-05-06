import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:luo3_app/theme/colors.dart';

class SelectRoleField extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  const SelectRoleField({
    super.key,
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        width: double.infinity,
        height: 55,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: isSelected ? Luo3Colors.primary : Luo3Colors.checkBoxBorder,
            width: 1.5,
          ),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2),
              child: Transform.scale(
                scale: 1.2,
                child: Checkbox(
                  value: isSelected,
                  activeColor: Luo3Colors.primary,
                  side: const BorderSide(
                    color: Luo3Colors.checkBoxBorder,
                    width: 1.5,
                  ),
                  onChanged: (_) =>
                      onTap(), // Trigger parent to update selection
                ),
              ),
            ),
            const SizedBox(width: 5),
            Text(
              title,
              style: GoogleFonts.inter(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: Luo3Colors.textPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
