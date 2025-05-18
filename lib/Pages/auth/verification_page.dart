import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:luo3_app/services/auth_services.dart';
import 'package:luo3_app/theme/colors.dart';

class VerificationPage extends StatefulWidget {
  const VerificationPage({super.key});

  @override
  State<VerificationPage> createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
  final List<FocusNode> _focusNodes = List.generate(6, (index) => FocusNode());
  final List<TextEditingController> _controllers =
      List.generate(6, (index) => TextEditingController());
  final AuthServices _auth = AuthServices();

  void _handleFocusChange() {
    setState(() {}); // Triggers UI update when focus changes
  }

  @override
  void initState() {
    super.initState();

    for (var node in _focusNodes) {
      node.addListener(_handleFocusChange);
    }
  }

  @override
  void dispose() {
    for (var node in _focusNodes) {
      node.removeListener(_handleFocusChange); // Properly remove listener
      node.dispose();
    }
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

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
                  // Navigator.pushReplacement(
                  //   context,
                  //   PageRouteBuilder(
                  //     transitionDuration: const Duration(milliseconds: 700),
                  //     pageBuilder: (context, animation, secondaryAnimation) =>
                  //         const CreateAccountPage(),
                  //     transitionsBuilder:
                  //         (context, animation, secondaryAnimation, child) {
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
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      'Verify your account',
                      style: GoogleFonts.inter(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        color: Luo3Colors.textPrimary,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Luo3Colors.textSecondary,
                        ),
                        children: [
                          const TextSpan(
                              text:
                                  'Please enter the code we just sent to email '),
                          TextSpan(
                            text: 'example@gmail.com',
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
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
            Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(6, (index) {
                    return Expanded(
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: _focusNodes[index].hasFocus
                                ? Luo3Colors.primary
                                : Luo3Colors.checkBoxBorder,
                            width: 2,
                          ),
                        ),
                        child: TextField(
                          controller: _controllers[index],
                          focusNode: _focusNodes[index],
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          maxLength: 1,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            counterText: '',
                          ),
                          onChanged: (value) {
                            if (value.isNotEmpty && index < 5) {
                              FocusScope.of(context).nextFocus();
                            }
                          },
                        ),
                      ),
                    );
                  }),
                )),
            const SizedBox(height: 20),
            Center(
              child: Text(
                "Didn’t receive OTP?",
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Luo3Colors.textSecondary,
                ),
              ),
            ),
            TextButton(
              onPressed: () async {
                String? phone = await _auth.getPhoneNumber();
                await _auth.verifyPhoneNumber(phone!);
              },
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
                minimumSize: const Size(0, 0),
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              child: Text(
                "Send code",
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Luo3Colors.primary,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
              child: SizedBox(
                width: double.infinity,
                height: 60,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Luo3Colors.primary,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  onPressed: () async {
                    // Combine all 6 input fields into one code string
                    String smsCode = _controllers.map((c) => c.text).join();

                    // Validate the OTP length before proceeding
                    if (smsCode.length < 6) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content:
                                Text("Please enter the full 6-digit code")),
                      );
                      return;
                    }

                    // Attempt to sign in using the SMS code
                    bool success = await _auth.signInWithSmsCode(smsCode);

                    if (success) {
                      // Get user and check role and navigate accordingly
                      String? role = await _auth.getUserRole();

                      if (role == 'Vehicle Renter') {
                        Navigator.pushReplacementNamed(
                            context, '/vehicle-renter-home');
                      } else if (role == 'Vehicle Owner') {
                        Navigator.pushReplacementNamed(
                            context, '/vehicle-owner-home');
                      } else if (role == 'Vehicle Driver') {
                        Navigator.pushReplacementNamed(
                            context, '/vehicle-owner-home');
                      } else if (role == 'Rental Agency') {
                        Navigator.pushReplacementNamed(
                            context, '/vehicle-owner-home');
                      } else if (role == 'Repair Shop Owner') {
                        Navigator.pushReplacementNamed(
                            context, '/vehicle-owner-home');
                      } else {
                        Navigator.pushReplacementNamed(
                            context, '/vehicle-owner-home');
                      }
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Verification failed")),
                      );
                    }
                  },
                  child: Text(
                    "Verify Account",
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
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
