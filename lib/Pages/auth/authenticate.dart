import 'package:flutter/material.dart';
import 'package:luo3_app/pages/auth/login_page.dart';
import 'package:luo3_app/pages/auth/select_role_page.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({super.key});

  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  // State to toggle between login and sign-up (role selection) pages
  bool showSignInPage = true;

  // Toggle method to switch views
  void toggleView() {
    setState(() {
      showSignInPage = !showSignInPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Based on the flag, show either login or role selection (register)
    return showSignInPage
        ? LoginPage(toggle: toggleView)
        : SelectRolePage(toggle: toggleView);
  }
}
