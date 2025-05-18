import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:luo3_app/components/secondary_button.dart';
import 'package:luo3_app/theme/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PaymentMethodProfilePage extends StatefulWidget {
  const PaymentMethodProfilePage({super.key});

  @override
  State<PaymentMethodProfilePage> createState() =>
      _PaymentMethodProfilePageState();
}

class _PaymentMethodProfilePageState extends State<PaymentMethodProfilePage> {
  final TextEditingController _paymentMethodController =
      TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadPaymentMethodData();
  }

  // Load previously saved data from shared preferences
  void _loadPaymentMethodData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _paymentMethodController.text = prefs.getString('payment_method') ?? '';
    });
  }

  // Save the current data to shared preferences
  void _savePaymentMethodData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('payment_method', _paymentMethodController.text);
    print("Payment method saved");
  }

  @override
  void dispose() {
    _paymentMethodController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Custom AppBar Section
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
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
                          const SizedBox(width: 60),
                          Text(
                            'Payment Method',
                            style: GoogleFonts.inter(
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                              color: Luo3Colors.textPrimary,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 40),
                      // Main Content Body
                      _buildPaymentMethodList(),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: SecondaryButton(
                name: "Save",
                onPressed: () {
                  _savePaymentMethodData(); // Save the entered data to shared preferences

                  // Show a Snackbar to inform the user that the data has been saved
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        "Payment method saved successfully!",
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
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

  // New payment method list body layout (matches another UI)
  Widget _buildPaymentMethodList() {
    return Column(
      children: [
        // Example of a current payment method card
        _buildPaymentMethodCard(
          method: _paymentMethodController.text.isNotEmpty
              ? _paymentMethodController.text
              : "No payment method added",
          isPrimary: true,
        ),
        const SizedBox(height: 20),
        // Add New Payment Method card (Similar to your Profile Page structure)
        GestureDetector(
          onTap: () {
            // Navigate to the page for adding a new payment method if needed
            // Example: Navigator.push(context, MaterialPageRoute(builder: (context) => NewPaymentMethodPage()));
          },
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  offset: const Offset(0, 4),
                  blurRadius: 6,
                ),
              ],
              color: Colors.white,
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.add_circle_outline,
                  color: Luo3Colors.primary,
                ),
                const SizedBox(width: 10),
                Text(
                  'Add New Payment Method',
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Luo3Colors.textPrimary,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  // Payment method card structure
  Widget _buildPaymentMethodCard({
    required String method,
    required bool isPrimary,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            offset: const Offset(0, 4),
            blurRadius: 6,
          ),
        ],
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            method,
            style: GoogleFonts.inter(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Luo3Colors.textPrimary,
            ),
          ),
          if (isPrimary)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: Luo3Colors.primary,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                'Primary',
                style: GoogleFonts.inter(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
