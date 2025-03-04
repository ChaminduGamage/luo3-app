import 'package:flutter/material.dart';
import 'package:luo3_app/theme/colors.dart';
import 'package:luo3_app/pages/splash/splash_page.dart';

class SplashPageLogo extends StatefulWidget {
  const SplashPageLogo({super.key});

  @override
  _SplashPageLogoState createState() => _SplashPageLogoState();
}

class _SplashPageLogoState extends State<SplashPageLogo> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _isLoading = false;
      });

      // Custom transition when navigating to SplashPage
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          transitionDuration:
              const Duration(milliseconds: 700), // Animation duration
          pageBuilder: (context, animation, secondaryAnimation) =>
              const SplashPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Luo3Colors.primary,
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 200,
                  width: 200,
                  child: Image(
                    image:
                        AssetImage('assets/images/splash/luo_logo_white.png'),
                  ),
                ),
                const SizedBox(height: 20),
                _isLoading
                    ? const CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      )
                    : Container(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
