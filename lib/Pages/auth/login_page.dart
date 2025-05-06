import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:luo3_app/services/auth_services.dart';
import 'package:luo3_app/theme/colors.dart';

class LoginPage extends StatefulWidget {
  final Function toggle;
  const LoginPage({super.key, required this.toggle});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final AuthServices _auth = AuthServices(); // ✅ Moved here

  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscurePassword = true;

  bool? isChecked = false;

  // Focus state variables
  bool _isEmailFocused = false;
  bool _isPasswordFocused = false;

  String email = '';
  String password = '';

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.only(top: 60),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Text(
                        'Welcome Back',
                        textAlign: TextAlign.center,
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
                      child: Text(
                        'Fill your information below or login with your social account',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Luo3Colors.textSecondary,
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    Text("Email",
                        style: GoogleFonts.inter(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Luo3Colors.textPrimary)),
                    TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: _isEmailFocused
                            ? Colors.transparent
                            : Luo3Colors.checkBoxBorder,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                              color: Luo3Colors.checkBoxBorder),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                              color: Luo3Colors.primary, width: 2),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.red),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(color: Colors.red, width: 2),
                        ),
                        hintText: "Enter your email",
                      ),
                      onTap: () {
                        setState(() {
                          _isEmailFocused = true;
                          email = _emailController.text;
                        });
                      },
                      onEditingComplete: () {
                        setState(() {
                          _isEmailFocused = false;
                          email = _emailController.text;
                        });
                      },
                      validator: (value) =>
                          value!.isEmpty ? 'Please enter your email' : null,
                    ),
                    const SizedBox(height: 15),
                    Text("Password",
                        style: GoogleFonts.inter(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Luo3Colors.textPrimary)),
                    TextFormField(
                      controller: _passwordController,
                      obscureText: _obscurePassword,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: _isPasswordFocused
                            ? Colors.transparent
                            : Luo3Colors.checkBoxBorder,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                              color: Luo3Colors.checkBoxBorder),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                              color: Luo3Colors.primary, width: 2),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.red),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(color: Colors.red, width: 2),
                        ),
                        hintText: "Enter your password",
                        suffixIcon: IconButton(
                          icon: Icon(_obscurePassword
                              ? Icons.visibility_off
                              : Icons.visibility),
                          onPressed: () {
                            setState(() {
                              _obscurePassword = !_obscurePassword;
                            });
                          },
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          _isPasswordFocused = true;
                          password = _passwordController.text;
                        });
                      },
                      onEditingComplete: () {
                        setState(() {
                          _isPasswordFocused = false;
                          password = _passwordController.text;
                        });
                      },
                      validator: (value) => value!.length < 6
                          ? 'Password must be at least 6 characters'
                          : null,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Row(
                        children: [
                          Transform.scale(
                            scale: 1.2, // Reducing the checkbox size
                            child: Checkbox(
                              value: isChecked,
                              activeColor: Luo3Colors.primary,
                              visualDensity:
                                  VisualDensity.compact, // Removes extra space
                              materialTapTargetSize: MaterialTapTargetSize
                                  .shrinkWrap, // Shrinks tap area
                              side: const BorderSide(
                                color: Luo3Colors.checkBoxBorder,
                                width: 1.5,
                              ),
                              onChanged: (newBool) {
                                setState(() {
                                  isChecked = newBool;
                                });
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 5.0),
                            child: Text(
                              "Agree with our,",
                              style: GoogleFonts.inter(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Luo3Colors.textPrimary,
                              ),
                            ),
                          ),
                          const SizedBox(width: 2.0),
                          TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                              minimumSize: const Size(0, 0),
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),
                            child: Text(
                              "Terms & Conditions",
                              style: GoogleFonts.inter(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Luo3Colors.primary,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),
                    SizedBox(
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
                          if (_formKey.currentState!.validate()) {
                            // ✅ Fixed here to use _auth in _LoginPageState
                            dynamic result =
                                await _auth.signInWithEmailAndPassword(
                              _emailController.text,
                              _passwordController.text,
                            );
                            if (result == null) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Invalid email or password"),
                                ),
                              );
                            } else {
                              Navigator.pushReplacementNamed(
                                  context, '/default-home');
                            }
                          }
                        },
                        child: Text(
                          "Sign In",
                          style: GoogleFonts.inter(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    Center(
                      child: Text(
                        "Or sign up with",
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Luo3Colors.textSecondary,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            color: Luo3Colors.checkBoxBorder,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: const Icon(
                            Icons.facebook,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            color: Luo3Colors.checkBoxBorder,
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            color: Luo3Colors.checkBoxBorder,
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account?",
                          style: GoogleFonts.inter(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Luo3Colors.textPrimary,
                          ),
                        ),
                        const SizedBox(width: 4.0),
                        TextButton(
                          onPressed: () {
                            widget.toggle();
                          },
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                            minimumSize: const Size(0, 0),
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                          child: Text(
                            "Sign Up",
                            style: GoogleFonts.inter(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Luo3Colors.primary,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
