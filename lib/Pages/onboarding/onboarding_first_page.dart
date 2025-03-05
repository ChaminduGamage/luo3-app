import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:luo3_app/components/custom_clipper.dart';
import 'package:luo3_app/pages/onboarding/onboarding_second_page.dart';
import 'package:luo3_app/pages/splash/splash_page.dart';
import 'package:luo3_app/theme/colors.dart';

class OnboardingFirstScreen extends StatelessWidget {
  const OnboardingFirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            /// Background Image
            const ClipPathWidgets(
              imageAsset: 'assets/images/onboarding/onboarding_first_image.jpg',
            ),

            Positioned(
              top: 0,
              right: 0,
              child: TextButton(
                onPressed: () {
                  // Navigate to the main screen (e.g., home or login)
                },
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

            ///  Main Content Section (Placed Inside `Align` to Avoid ParentDataWidget Error)
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 40),
                child: Column(
                  mainAxisSize: MainAxisSize.min, // Fix ParentDataWidget Issue
                  children: [
                    /// Title
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "The Smart Way to ",
                          style: GoogleFonts.inter(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                            color: Luo3Colors.textPrimary,
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            style: GoogleFonts.inter(
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                            ),
                            children: const [
                              TextSpan(
                                text: "Rent Vehicles ",
                                style: TextStyle(color: Luo3Colors.primary),
                              ),
                              TextSpan(
                                text: "Around You!",
                                style: TextStyle(color: Luo3Colors.textPrimary),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 40),

                    /// Description
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
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
                    const SizedBox(height: 75),

                    /// Navigation Buttons
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          /// Back Button
                          GestureDetector(
                            onTap: () {
                              Navigator.pushReplacement(
                                context,
                                PageRouteBuilder(
                                  transitionDuration:
                                      const Duration(milliseconds: 700),
                                  pageBuilder: (context, animation,
                                          secondaryAnimation) =>
                                      const SplashPage(),
                                  transitionsBuilder: (context, animation,
                                      secondaryAnimation, child) {
                                    var tween = Tween(
                                      begin: const Offset(-1.0, 0.0),
                                      end: Offset.zero,
                                    ).chain(
                                        CurveTween(curve: Curves.easeInOut));

                                    return SlideTransition(
                                      position: animation.drive(tween),
                                      child: child,
                                    );
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
                                  color: Luo3Colors.primary,
                                  width: 2,
                                ),
                              ),
                              child: const Icon(
                                Icons.arrow_back,
                                color: Luo3Colors.primary,
                              ),
                            ),
                          ),

                          /// Page Indicator
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(3, (index) {
                              return Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                width: 10,
                                height: 10,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: index == 0
                                      ? Luo3Colors.primary
                                      : Luo3Colors.textSecondary,
                                ),
                              );
                            }),
                          ),

                          /// Next Button
                          GestureDetector(
                            onTap: () {
                              Navigator.pushReplacement(
                                context,
                                PageRouteBuilder(
                                  transitionDuration:
                                      const Duration(milliseconds: 700),
                                  pageBuilder: (context, animation,
                                          secondaryAnimation) =>
                                      const OnboardingSecondScreen(),
                                  transitionsBuilder: (context, animation,
                                      secondaryAnimation, child) {
                                    var tween = Tween(
                                      begin: const Offset(1.0, 0.0),
                                      end: Offset.zero,
                                    ).chain(
                                        CurveTween(curve: Curves.easeInOut));

                                    return SlideTransition(
                                      position: animation.drive(tween),
                                      child: child,
                                    );
                                  },
                                ),
                              );
                            },
                            child: Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                color: Luo3Colors.primary,
                                borderRadius: BorderRadius.circular(100),
                                border: Border.all(
                                  color: Luo3Colors.primary,
                                  width: 2,
                                ),
                              ),
                              child: const Icon(
                                Icons.arrow_forward,
                                color: Luo3Colors.background,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
