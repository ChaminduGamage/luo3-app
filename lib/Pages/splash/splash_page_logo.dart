import 'package:flutter/material.dart';
import 'package:luo3_app/theme/colors.dart';
import 'package:luo3_app/pages/splash/splash_page.dart';

class SplashPageLogo extends StatefulWidget {
  const SplashPageLogo({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SplashPageLogoState createState() => _SplashPageLogoState();
}

class _SplashPageLogoState extends State<SplashPageLogo> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        // ignore: use_build_context_synchronously
        context,
        MaterialPageRoute(builder: (context) => const SplashPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Luo3Colors.primary,
        ),
        child: const Center(
          child: SizedBox(
            height: 200,
            width: 200,
            child: Image(
              image: AssetImage('assets/images/splash/luo_logo_white.png'),
            ),
          ),
        ),
      ),
    );
  }
}
