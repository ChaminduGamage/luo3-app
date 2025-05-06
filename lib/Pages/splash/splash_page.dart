import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:luo3_app/pages/onboarding/onboarding_first_page.dart';
import 'package:luo3_app/theme/colors.dart';
import 'package:luo3_app/components/custom_clipper.dart';
import 'package:luo3_app/components/primary_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            const ClipPathWidgets(
              imageAsset: 'assets/images/splash/luo_logo_abstract_circle.jpg',
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: "The Smart Way to ",
                                style: GoogleFonts.inter(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w600,
                                  color: Luo3Colors.textPrimary,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: "Rent Vehicles ",
                                style: GoogleFonts.inter(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w600,
                                  color: Luo3Colors.primary,
                                ),
                              ),
                              TextSpan(
                                text: "Around You!",
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
                  ),
                  const SizedBox(height: 40),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    width: double.infinity,
                    child: Text(
                      "Discover a smarter way to rent vehicles, connecting you with trusted owners quickly and reliably.",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Luo3Colors.textSecondary,
                      ),
                    ),
                  ),
                  const SizedBox(height: 25),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    width: double.infinity,
                    height: 60,
                    child: PrimaryButton(
                      title: "Let's Get Started",
                      onPressed: () async {
                        final prefs = await SharedPreferences.getInstance();
                        await prefs.setBool('hasSeenSplash', true);

                        Navigator.pushReplacement(
                          context,
                          PageRouteBuilder(
                            transitionDuration:
                                const Duration(milliseconds: 700),
                            pageBuilder:
                                (context, animation, secondaryAnimation) =>
                                    const OnboardingFirstScreen(),
                            transitionsBuilder: (context, animation,
                                secondaryAnimation, child) {
                              return FadeTransition(
                                  opacity: animation, child: child);
                            },
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an account?",
                          style: GoogleFonts.inter(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Luo3Colors.textPrimary,
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "Sign In",
                            style: GoogleFonts.inter(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Luo3Colors.primary,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
