import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:luo3_app/theme/colors.dart';

class SelectRoleField extends StatefulWidget {
  final String title;
  const SelectRoleField({super.key, required this.title});

  @override
  State<SelectRoleField> createState() => _SelectRoleFieldState();
}

class _SelectRoleFieldState extends State<SelectRoleField> {
  bool? isChecked = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isChecked = !(isChecked ?? false);
        });
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        width: double.infinity,
        height: 55,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: (isChecked ?? false)
                ? Luo3Colors.primary
                : Luo3Colors.checkBoxBorder, // Change border color
            width: 1.5,
          ),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2),
              child: Transform.scale(
                scale: 1.2, // Adjust checkbox size
                child: Checkbox(
                  value: isChecked,
                  activeColor: Luo3Colors.primary, // Checked state color
                  side: const BorderSide(
                    color: Luo3Colors
                        .checkBoxBorder, // Change border color when unchecked
                    width: 1.5,
                  ),
                  onChanged: (newBool) {
                    setState(() {
                      isChecked = newBool;
                    });
                  },
                ),
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              widget.title, // Add some text
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
