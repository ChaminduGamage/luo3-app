import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:luo3_app/components/secondary_button.dart';
import 'package:luo3_app/services/auth_services.dart';
import 'package:luo3_app/theme/colors.dart';

class ProfileCompletePage extends StatefulWidget {
  const ProfileCompletePage({super.key});

  @override
  State<ProfileCompletePage> createState() => _ProfileCompletePageState();
}

class _ProfileCompletePageState extends State<ProfileCompletePage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final AuthServices _auth = AuthServices();

  bool? isChecked = false;

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _ageController.dispose();
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
                      GestureDetector(
                        onTap: () {
                          // Navigator.pushReplacement(
                          //   context,
                          //   PageRouteBuilder(
                          //     transitionDuration:
                          //         const Duration(milliseconds: 700),
                          //     pageBuilder:
                          //         (context, animation, secondaryAnimation) =>
                          //             const CreateAccountPage(),
                          //     transitionsBuilder: (context, animation,
                          //         secondaryAnimation, child) {
                          //       var tween = Tween(
                          //         begin: const Offset(-1.0, 0.0),
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
                      const SizedBox(height: 30),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Complete Your Profile',
                          style: GoogleFonts.inter(
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                            color: Luo3Colors.textPrimary,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Text(
                          "Don't worry, only you can see your personal data. No one else will be able to see it.",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.inter(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Luo3Colors.textSecondary,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Align(
                        alignment: Alignment.center,
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: const Icon(
                                Icons.person,
                                color: Luo3Colors.primary,
                                size: 40,
                              ),
                            ),
                            Positioned(
                              right: -10,
                              bottom: -5,
                              child: Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: const Icon(
                                  Icons.add_a_photo,
                                  color: Luo3Colors.primary,
                                  size: 15,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 40),
                      Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Name",
                              style: GoogleFonts.inter(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Luo3Colors.textPrimary,
                              ),
                            ),
                            const SizedBox(height: 8),
                            TextFormField(
                              controller: _nameController,
                              decoration: _inputDecoration("Enter your name"),
                              validator: (value) => value!.isEmpty
                                  ? 'Please enter your name'
                                  : null,
                            ),
                            const SizedBox(height: 15),
                            Text(
                              "Phone Number",
                              style: GoogleFonts.inter(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Luo3Colors.textPrimary,
                              ),
                            ),
                            const SizedBox(height: 8),
                            TextFormField(
                              controller: _phoneController,
                              keyboardType: TextInputType.phone,
                              decoration:
                                  _inputDecoration("Enter your phone number"),
                              validator: (value) => value!.isEmpty
                                  ? 'Please enter your phone number'
                                  : null,
                            ),
                            const SizedBox(height: 15),
                            Text(
                              "Age",
                              style: GoogleFonts.inter(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Luo3Colors.textPrimary,
                              ),
                            ),
                            const SizedBox(height: 8),
                            TextFormField(
                              controller: _ageController,
                              keyboardType: TextInputType.number,
                              decoration: _inputDecoration("Enter your age"),
                              validator: (value) => value!.isEmpty
                                  ? 'Please enter your age'
                                  : null,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: SecondaryButton(
                name: "Continue",
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    // Proceed with account creation logic
                    await _auth.setProfile(
                      fullName: _nameController.text,
                      phoneNumber: _phoneController.text,
                      age: int.parse(_ageController.text),
                    );

                    Navigator.pushNamedAndRemoveUntil(
                        context, '/verification', (route) => false);
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  InputDecoration _inputDecoration(String hintText) {
    return InputDecoration(
      filled: true,
      fillColor: Luo3Colors.checkBoxBorder,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Luo3Colors.checkBoxBorder),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Luo3Colors.primary, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Colors.red),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Colors.red, width: 2),
      ),
      hintText: hintText,
    );
  }
}
