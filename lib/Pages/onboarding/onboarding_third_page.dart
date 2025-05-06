import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:luo3_app/components/custom_clipper.dart';
import 'package:luo3_app/pages/onboarding/onboarding_second_page.dart';
import 'package:luo3_app/theme/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:luo3_app/pages/wrapper.dart';

class OnboardingThirdScreen extends StatelessWidget {
  const OnboardingThirdScreen({super.key});

  // ✅ Fix: Save onboarding completion correctly
  Future<void> _markOnboardingCompleted(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('hasCompletedOnboarding', true); // Updated key

    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 700),
        pageBuilder: (context, animation, secondaryAnimation) =>
            const Wrapper(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          var tween = Tween(
            begin: const Offset(1.0, 0.0),
            end: Offset.zero,
          ).chain(CurveTween(curve: Curves.easeInOut));
          return SlideTransition(
              position: animation.drive(tween), child: child);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            const ClipPathWidgets(
              imageAsset: 'assets/images/onboarding/onboarding_third_image.jpg',
            ),
            Positioned(
              top: 0,
              right: 0,
              child: TextButton(
                onPressed: () => _markOnboardingCompleted(context),
                child: Text(
                  "Skip",
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Luo3Colors.primary,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Drink Responsibly— ",
                        style: GoogleFonts.inter(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: Luo3Colors.textPrimary,
                        ),
                      ),
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: "Let a Driver ",
                              style: GoogleFonts.inter(
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                                color: Luo3Colors.primary,
                              ),
                            ),
                            TextSpan(
                              text: "Take You Home!",
                              style: GoogleFonts.inter(
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                                color: Luo3Colors.textPrimary,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 40),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      "Activate Drinking Mode and get a driver with one tap when you’re ready to go home safely.",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Luo3Colors.textSecondary,
                      ),
                    ),
                  ),
                  const SizedBox(height: 75),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // ⬅️ Back
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              PageRouteBuilder(
                                transitionDuration:
                                    const Duration(milliseconds: 700),
                                pageBuilder:
                                    (context, animation, secondaryAnimation) =>
                                        const OnboardingSecondScreen(),
                                transitionsBuilder: (context, animation,
                                    secondaryAnimation, child) {
                                  var tween = Tween(
                                    begin: const Offset(-1.0, 0.0),
                                    end: Offset.zero,
                                  ).chain(CurveTween(curve: Curves.easeInOut));
                                  return SlideTransition(
                                      position: animation.drive(tween),
                                      child: child);
                                },
                              ),
                            );
                          },
                          child: Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              border: Border.all(
                                  color: Luo3Colors.primary, width: 2),
                            ),
                            child: const Icon(Icons.arrow_back,
                                color: Luo3Colors.primary),
                          ),
                        ),

                        // Dots
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(3, (index) {
                            return Container(
                              margin: const EdgeInsets.symmetric(horizontal: 5),
                              width: 10,
                              height: 10,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: index == 2
                                    ? Luo3Colors.primary
                                    : Luo3Colors.textSecondary,
                              ),
                            );
                          }),
                        ),

                        // ✅ Done Button
                        GestureDetector(
                          onTap: () => _markOnboardingCompleted(context),
                          child: Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              color: Luo3Colors.primary,
                              borderRadius: BorderRadius.circular(100),
                              border: Border.all(
                                  color: Luo3Colors.primary, width: 2),
                            ),
                            child: const Icon(Icons.arrow_forward,
                                color: Luo3Colors.background),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
