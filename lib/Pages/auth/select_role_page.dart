import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:luo3_app/components/secondary_button.dart';
import 'package:luo3_app/components/select_role_field.dart';
import 'package:luo3_app/pages/auth/create_account_page.dart';
import 'package:luo3_app/pages/onboarding/onboarding_third_page.dart';
import 'package:luo3_app/theme/colors.dart';

class SelectRolePage extends StatefulWidget {
  final Function toggle;

  const SelectRolePage({super.key, required this.toggle});

  @override
  State<SelectRolePage> createState() => _SelectRolePageState();
}

class _SelectRolePageState extends State<SelectRolePage> {
  bool? isChecked = false;

  String? selectedRole;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              alignment: AlignmentDirectional.topStart,
              child: GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    PageRouteBuilder(
                      transitionDuration: const Duration(milliseconds: 700),
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          const OnboardingThirdScreen(),
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                        var tween = Tween(
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
                  margin: const EdgeInsets.only(top: 20, left: 20),
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
            ),
            const SizedBox(height: 30),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: "What is your role are you\n",
                style: GoogleFonts.inter(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: Luo3Colors.textPrimary,
                ),
                children: [
                  TextSpan(
                    text: "login as?",
                    style: GoogleFonts.inter(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      color: Luo3Colors.textPrimary,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            SelectRoleField(
              title: "As a vehicle owner",
              isSelected: selectedRole == "Vehicle Owner",
              onTap: () {
                setState(() {
                  selectedRole = "Vehicle Owner";
                });
              },
            ),
            const SizedBox(height: 10),
            SelectRoleField(
              title: "As a vehicle renter",
              isSelected: selectedRole == "Vehicle Renter",
              onTap: () {
                setState(() {
                  selectedRole = "Vehicle Renter";
                });
              },
            ),
            const SizedBox(height: 10),
            SelectRoleField(
              title: "As a vehicle driver",
              isSelected: selectedRole == "Vehicle Driver",
              onTap: () {
                setState(() {
                  selectedRole = "Vehicle Driver";
                });
              },
            ),
            const SizedBox(height: 10),
            SelectRoleField(
              title: "As a vehicle rental agency",
              isSelected: selectedRole == "Rental Agency",
              onTap: () {
                setState(() {
                  selectedRole = "Rental Agency";
                });
              },
            ),
            const SizedBox(height: 10),
            SelectRoleField(
              title: "As a vehicle repair shop owner",
              isSelected: selectedRole == "Repair Shop Owner",
              onTap: () {
                setState(() {
                  selectedRole = "Repair Shop Owner";
                });
              },
            ),
            const Spacer(),
            SecondaryButton(
              name: "Create an account",
              onPressed: () {
                if (selectedRole != null) {
                  // Navigate to Register Page and pass selectedRole
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CreateAccountPage(
                          toggle: widget.toggle, selectedRole: selectedRole!),
                    ),
                  );
                } else {
                  // Show alert dialog if no role selected
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text("Please select a role"),
                      actions: [
                        TextButton(
                          child: const Text("OK"),
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                      ],
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
