import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:luo3_app/theme/colors.dart';
import 'package:luo3_app/components/secondary_button.dart';

class AddCardPage extends StatefulWidget {
  const AddCardPage({super.key});

  @override
  State<AddCardPage> createState() => _AddCardPageState();
}

class _AddCardPageState extends State<AddCardPage> {
  final _cardNumberController = TextEditingController();
  final _expiryDateController = TextEditingController();
  final _cvvController = TextEditingController();
  bool _acceptedPolicy = false;

  @override
  void dispose() {
    _cardNumberController.dispose();
    _expiryDateController.dispose();
    _cvvController.dispose();
    super.dispose();
  }

  Widget _buildInputField({
    required String label,
    required TextEditingController controller,
    required IconData icon,
    required String hintText,
    bool obscure = false,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.inter(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Luo3Colors.textPrimary,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          height: 50,
          decoration: BoxDecoration(
            color: Luo3Colors.checkBoxBorder,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Luo3Colors.checkBoxBorder,
              width: 1.5,
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            children: [
              Icon(icon, color: Luo3Colors.primary),
              const SizedBox(width: 10),
              Expanded(
                child: TextField(
                  controller: controller,
                  obscureText: obscure,
                  keyboardType: keyboardType,
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Luo3Colors.textPrimary,
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: hintText,
                    hintStyle: GoogleFonts.inter(
                      color: Luo3Colors.textSecondary,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 15),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Back Button + Title
                  Row(
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
                          child: const Icon(
                            Icons.arrow_back,
                            color: Luo3Colors.textPrimary,
                          ),
                        ),
                      ),
                      const SizedBox(width: 90),
                      Text(
                        'Add Card',
                        style: GoogleFonts.inter(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                          color: Luo3Colors.textPrimary,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  _buildInputField(
                    label: 'Card Number',
                    controller: _cardNumberController,
                    icon: Icons.credit_card,
                    hintText: 'XXXX XXXX XXXX XXXX',
                    keyboardType: TextInputType.number,
                  ),
                  _buildInputField(
                    label: 'Expiry Date',
                    controller: _expiryDateController,
                    icon: Icons.calendar_today,
                    hintText: 'MM/YY',
                    keyboardType: TextInputType.datetime,
                  ),
                  _buildInputField(
                    label: 'CVV',
                    controller: _cvvController,
                    icon: Icons.lock_outline,
                    hintText: 'XXX',
                    obscure: true,
                    keyboardType: TextInputType.number,
                  ),

                  // ✅ Privacy Policy Checkbox
                  Row(
                    children: [
                      Checkbox(
                        value: _acceptedPolicy,
                        onChanged: (value) {
                          setState(() {
                            _acceptedPolicy = value ?? false;
                          });
                        },
                        activeColor: Luo3Colors.primary,
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {},
                          child: Text(
                            "I agree to the Privacy Policy",
                            style: GoogleFonts.inter(
                              fontSize: 16,
                              color: Luo3Colors.textPrimary,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: SecondaryButton(
                name: "Save Card",
                onPressed: () {
                  if (_acceptedPolicy) {
                    Navigator.pop(context);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          "Please accept the Privacy Policy.",
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                        backgroundColor: Colors.redAccent,
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
