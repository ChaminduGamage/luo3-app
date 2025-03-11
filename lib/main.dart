import 'package:flutter/material.dart';
import 'package:luo3_app/pages/auth/create_account_page.dart';
import 'package:luo3_app/pages/auth/verification_page.dart';

void main() {
  runApp(const Luo3App());
}

class Luo3App extends StatelessWidget {
  const Luo3App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Luo3 App',
      home: SafeArea(
        child: CreateAccountPage(),
      ),
    );
  }
}
