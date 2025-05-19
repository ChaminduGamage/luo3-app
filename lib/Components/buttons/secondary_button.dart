import 'package:flutter/material.dart';
import 'package:luo3_app/components/buttons/primary_button.dart';
import 'package:luo3_app/theme/colors.dart';

class SecondaryButton extends StatefulWidget {
  final VoidCallback onPressed; // Store the function
  final String name;

  const SecondaryButton(
      {super.key, required this.onPressed, required this.name});

  @override
  State<SecondaryButton> createState() => _SecondayButtonState();
}

class _SecondayButtonState extends State<SecondaryButton> {
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
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
        child: SizedBox(
          height: 60,
          width: double.infinity,
          child: PrimaryButton(
            title: widget.name,
            onPressed: widget.onPressed, // Use the passed function
          ),
        ),
      ),
    );
  }
}
