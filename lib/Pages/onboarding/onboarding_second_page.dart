import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:luo3_app/components/custom_clipper.dart';
import 'package:luo3_app/pages/onboarding/onboarding_first_page.dart';
import 'package:luo3_app/pages/onboarding/onboarding_third_page.dart';
import 'package:luo3_app/theme/colors.dart';

class OnboardingSecondScreen extends StatelessWidget {
  const OnboardingSecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            /// Background Image
            const ClipPathWidgets(
              imageAsset:
                  'assets/images/onboarding/onboarding_second_image.jpg',
            ),

            Positioned(
              top: 0, // Adjust as needed
              right: 0,
              child: TextButton(
                onPressed: () {
                  // Navigator.pushReplacement(
                  //   context,
                  //   PageRouteBuilder(
                  //     transitionDuration: const Duration(milliseconds: 700),
                  //     pageBuilder: (context, animation, secondaryAnimation) =>
                  //         const SelectRolePage(),
                  //     transitionsBuilder:
                  //         (context, animation, secondaryAnimation, child) {
                  //       var tween = Tween(
                  //         begin: const Offset(1.0, 0.0),
                  //         end: Offset.zero,
                  //       ).chain(CurveTween(curve: Curves.easeInOut));

                  //       return SlideTransition(
                  //         position: animation.drive(tween),
                  //         child: child,
                  //       );
                  //     },
                  //   ),
                  // );
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

            /// Bottom Content Section (Aligned Properly)
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 40),
                child: Column(
                  mainAxisSize: MainAxisSize.min, // ✅ Prevents layout issues
                  children: [
                    /// Title
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Hire a Trusted ",
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
                                text: "Driver ",
                                style: TextStyle(color: Luo3Colors.primary),
                              ),
                              TextSpan(
                                text: "for a Safe, Easy Ride!",
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
                        "Need a driver? Find experienced and verified drivers near you for a safe ride to your destination.",
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
                                      const OnboardingFirstScreen(),
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
                                  color: index == 1
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
                                      const OnboardingThirdScreen(),
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
