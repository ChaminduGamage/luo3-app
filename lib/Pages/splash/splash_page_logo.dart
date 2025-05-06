import 'package:flutter/material.dart';
import 'package:luo3_app/components/nav_bar.dart';
import 'package:luo3_app/theme/colors.dart';
import 'package:luo3_app/pages/splash/splash_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPageLogo extends StatefulWidget {
  const SplashPageLogo({super.key});

  @override
  _SplashPageLogoState createState() => _SplashPageLogoState();
}

class _SplashPageLogoState extends State<SplashPageLogo> {
  bool _isLoading = true;

  Future<bool> _checkOnboardingStatus() async {
    final prefs = await SharedPreferences.getInstance();
    bool? hasCompleted = prefs.getBool('hasCompletedOnboarding');

    return hasCompleted ?? false;
  }

  @override
  void initState() {
    super.initState();

    _checkOnboardingStatus();

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
          pageBuilder: (context, animation, secondaryAnimation) {
            final nextPage = _checkOnboardingStatus().then(
              (hasCompleted) =>
                  hasCompleted ? const Luo3NavBar() : const SplashPage(),
            );
            return FutureBuilder(
              future: nextPage,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done &&
                    snapshot.hasData) {
                  return snapshot.data as Widget;
                }
                return const SizedBox.shrink(); // Placeholder while waiting
              },
            );
          },
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
          child: const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 200,
                  width: 200,
                  child: Image(
                    image:
                        AssetImage('assets/images/splash/luo_logo_white.png'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
