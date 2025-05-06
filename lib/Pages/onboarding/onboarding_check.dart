import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:luo3_app/pages/splash/splash_page.dart';
import 'package:luo3_app/pages/wrapper.dart';

class OnboardingCheck extends StatefulWidget {
  const OnboardingCheck({super.key});

  @override
  State<OnboardingCheck> createState() => _OnboardingCheckState();
}

class _OnboardingCheckState extends State<OnboardingCheck> {
  bool _isLoading = true;
  bool _seenSplash = false;
  bool _hasCompletedOnboarding = false;

  @override
  void initState() {
    super.initState();
    _checkFirstSeen();
    _checkOnboardingStatus();
  }

  Future<void> _checkFirstSeen() async {
    final prefs = await SharedPreferences.getInstance();
    bool hasSeenSplash = prefs.getBool('hasSeenSplash') ?? false;

    setState(() {
      _seenSplash = hasSeenSplash;
    });
  }

  Future<void> _checkOnboardingStatus() async {
    final prefs = await SharedPreferences.getInstance();
    bool hasCompleted = prefs.getBool('hasCompletedOnboarding') ?? false;

    setState(() {
      _hasCompletedOnboarding = hasCompleted;
      _isLoading = false;
    });
  }

  Future<void> markOnboardingCompleted() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('hasCompletedOnboarding', true);
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    } else {
      // If the user has completed onboarding, go to the Wrapper page
      if (_seenSplash && _hasCompletedOnboarding) {
        return const Wrapper();
      } else {
        // Otherwise, show splash or onboarding pages
        return const SplashPage();
      }
    }
  }
}
