import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:luo3_app/components/secondary_button.dart';
import 'package:luo3_app/theme/colors.dart';

class AddNewAddressPage extends StatefulWidget {
  const AddNewAddressPage({super.key});

  @override
  State<AddNewAddressPage> createState() => _AddNewAddressPageState();
}

class _AddNewAddressPageState extends State<AddNewAddressPage> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            // Custom AppBar
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
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
                      child: const Icon(Icons.arrow_back,
                          color: Luo3Colors.textPrimary),
                    ),
                  ),
                  const SizedBox(width: 70),
                  Text(
                    'Add Address',
                    style: GoogleFonts.inter(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      color: Luo3Colors.textPrimary,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // Form
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildInputField(_titleController, TextInputType.text,
                        "Address Title (e.g. Home, Office)"),
                    const SizedBox(height: 20),
                    _buildInputField(_addressController,
                        TextInputType.multiline, "Full Address",
                        maxLines: 4),
                    const SizedBox(height: 15), // spacing above button
                  ],
                ),
              ),
            ),

            // Save Address Button
            SizedBox(
              width: double.infinity,
              child: SecondaryButton(
                name: "Save Address",
                onPressed: () {
                  final title = _titleController.text.trim();
                  final address = _addressController.text.trim();

                  if (title.isEmpty || address.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          "Please fill out all fields",
                          style: GoogleFonts.inter(color: Colors.white),
                        ),
                        backgroundColor: Colors.red,
                      ),
                    );
                    return;
                  }

                  // Pass the new address data back
                  Navigator.pop(context, {
                    'title': title,
                    'address': address,
                  });

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        "Address saved successfully!",
                        style: GoogleFonts.inter(color: Colors.white),
                      ),
                      backgroundColor: Luo3Colors.textPrimary,
                      behavior: SnackBarBehavior.floating,
                      duration: const Duration(seconds: 2),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInputField(TextEditingController controller,
      TextInputType keyboardType, String labelText,
      {int maxLines = 1}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: GoogleFonts.inter(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Luo3Colors.textPrimary,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          keyboardType: keyboardType,
          maxLines: maxLines,
          decoration: InputDecoration(
            filled: true,
            fillColor: Luo3Colors.checkBoxBorder,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Luo3Colors.checkBoxBorder),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Luo3Colors.primary, width: 2),
            ),
            hintText: "Enter $labelText",
          ),
        ),
      ],
    );
  }
}
