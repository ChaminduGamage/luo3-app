import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:luo3_app/components/primary_button.dart';
import 'package:luo3_app/components/select_role_field.dart';
import 'package:luo3_app/pages/onboarding/onboarding_third_page.dart';
import 'package:luo3_app/theme/colors.dart';

class SelectRolePage extends StatefulWidget {
  const SelectRolePage({super.key});

  @override
  State<SelectRolePage> createState() => _SelectRolePageState();
}

class _SelectRolePageState extends State<SelectRolePage> {
  bool? isChecked = false;

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
            const SelectRoleField(title: "As a vehicle owner"),
            const SizedBox(height: 10),
            const SelectRoleField(title: "As a vehicle renter"),
            const SizedBox(height: 10),
            const SelectRoleField(title: "As a vehicle driver"),
            const SizedBox(height: 10),
            const SelectRoleField(title: "As a vehicle rental agancy"),
            const SizedBox(height: 10),
            const SelectRoleField(title: "As a vehicle repair shop owner"),
            const Spacer(),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Luo3Colors.scaffoldColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black
                        // ignore: deprecated_member_use
                        .withOpacity(0.3), // Shadow color with opacity
                    blurRadius: 15, // Soft blur effect
                    spreadRadius: 3, // Spread of the shadow
                    offset: const Offset(
                        0, 5), // Moves the shadow downward (drop shadow)
                  ),
                ],
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                child: SizedBox(
                  height: 60,
                  width: double.infinity,
                  child: PrimaryButton(
                    title: "Create Account",
                    onPressed: () {},
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
