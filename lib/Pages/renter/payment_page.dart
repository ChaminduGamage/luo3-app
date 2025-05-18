import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:luo3_app/components/nav_bar.dart';
import 'package:luo3_app/components/secondary_button.dart';
import 'package:luo3_app/pages/renter/add_credit_card_page.dart';
import 'package:luo3_app/theme/colors.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  bool? isChecked = false;
  String? _selectedMethod;

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
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            PageRouteBuilder(
                              transitionDuration:
                                  const Duration(milliseconds: 700),
                              pageBuilder:
                                  (context, animation, secondaryAnimation) =>
                                      const Luo3NavBar(),
                              transitionsBuilder: (context, animation,
                                  secondaryAnimation, child) {
                                final tween = Tween(
                                  begin: const Offset(-1.0, 0.0),
                                  end: Offset.zero,
                                ).chain(CurveTween(curve: Curves.easeInOut));
                                return SlideTransition(
                                  position: animation.drive(tween),
                                  child: child,
                                );
                              },
                            ),
                          );
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
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  Text(
                    "Cash",
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
                        const Icon(
                          Icons.attach_money,
                          color: Luo3Colors.primary,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          "Cash",
                          style: GoogleFonts.inter(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Luo3Colors.textPrimary,
                          ),
                        ),
                        const Expanded(
                            child: SizedBox()), // keeps spacing like text field
                        Checkbox(
                          value: _selectedMethod == 'Cash',
                          onChanged: (_) {
                            setState(() {
                              _selectedMethod = 'Cash';
                            });
                          },
                          activeColor: Luo3Colors.primary,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    "Wallet",
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
                        const Icon(
                          Icons.wallet,
                          color: Luo3Colors.primary,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          "Wallet",
                          style: GoogleFonts.inter(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Luo3Colors.textPrimary,
                          ),
                        ),
                        const Expanded(
                            child: SizedBox()), // keeps spacing like text field
                        Checkbox(
                          value: _selectedMethod == 'Wallet',
                          onChanged: (_) {
                            setState(() {
                              _selectedMethod = 'Wallet';
                            });
                          },
                          activeColor: Luo3Colors.primary,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    "Credit/Debit Card",
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Luo3Colors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 8),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AddCardPage()),
                      );
                    },
                    child: Container(
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
                          const Icon(
                            Icons.credit_card,
                            color: Luo3Colors.primary,
                          ),
                          const SizedBox(width: 10),
                          Text(
                            "Add Credit/Debit Card",
                            style: GoogleFonts.inter(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Luo3Colors.textPrimary,
                            ),
                          ),
                          const Expanded(child: SizedBox()),
                          const Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Icon(
                              Icons.arrow_forward_ios,
                              color: Luo3Colors.primary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: SecondaryButton(
                name: "Confirm Payment",
                onPressed: () {
                  // Confirm payment logic
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
