import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:luo3_app/components/secondary_button.dart';
import 'package:luo3_app/pages/auth/profile_complete_page.dart';
import 'package:luo3_app/theme/colors.dart';

class DrivingLicensePage extends StatefulWidget {
  const DrivingLicensePage({super.key});

  @override
  State<DrivingLicensePage> createState() => _DrivingLicensePageState();
}

class _DrivingLicensePageState extends State<DrivingLicensePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
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
                                      const ProfileCompletePage(),
                              transitionsBuilder: (context, animation,
                                  secondaryAnimation, child) {
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
                      const SizedBox(width: 70),
                      Text(
                        'Driving License',
                        style: GoogleFonts.inter(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                          color: Luo3Colors.textPrimary,
                        ),
                        overflow:
                            TextOverflow.ellipsis, // Prevents text overflow
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  Row(
                    crossAxisAlignment:
                        CrossAxisAlignment.start, // Aligns the text properly
                    children: [
                      Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Luo3Colors.primary,
                        ),
                        child: const Icon(
                          Icons.arrow_right,
                          color: Luo3Colors.background,
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        // Wrap the text in Expanded to prevent overflow
                        child: Text(
                          'Photocopies and printouts of documents will not be accepted.',
                          style: GoogleFonts.inter(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Luo3Colors.textSecondary,
                          ),
                          softWrap: true, // Ensures text wraps properly
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    crossAxisAlignment:
                        CrossAxisAlignment.start, // Aligns the text properly
                    children: [
                      Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Luo3Colors.primary,
                        ),
                        child: const Icon(
                          Icons.arrow_right,
                          color: Luo3Colors.background,
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        // Wrap the text in Expanded to prevent overflow
                        child: Text(
                          'The photo and all details must be clearly visible.',
                          style: GoogleFonts.inter(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Luo3Colors.textSecondary,
                          ),
                          softWrap: true, // Ensures text wraps properly
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    crossAxisAlignment:
                        CrossAxisAlignment.start, // Aligns the text properly
                    children: [
                      Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Luo3Colors.primary,
                        ),
                        child: const Icon(
                          Icons.arrow_right,
                          color: Luo3Colors.background,
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        // Wrap the text in Expanded to prevent overflow
                        child: Text(
                          'Only documents that are less than 10 MB in size and in JPG, JPEG, PNG, or PDF format will be accepted.',
                          style: GoogleFonts.inter(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Luo3Colors.textSecondary,
                          ),
                          softWrap: true, // Ensures text wraps properly
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // Horizontal Line Separator
                  const Divider(
                    color: Luo3Colors.checkBoxBorder, // Light grey color
                    thickness: 1, // Line thickness
                  ),
                  const SizedBox(height: 15),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Attach driving license :',
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Luo3Colors.textPrimary,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Container(
                    width: double.infinity,
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Luo3Colors.checkBoxBorder,
                        width: 1,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'Upload your driving license',
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Luo3Colors.textSecondary,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Note :',
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Luo3Colors.primary, // Updated color for 'Note'
                        ),
                      ),
                      Expanded(
                        child: Text(
                          ' Please upload both sides of Driving License',
                          style: GoogleFonts.inter(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Luo3Colors.textPrimary,
                          ),
                          softWrap: true,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: SecondaryButton(
                name: "Done",
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
