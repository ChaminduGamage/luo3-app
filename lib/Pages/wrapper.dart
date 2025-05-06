import 'package:flutter/material.dart';
import 'package:luo3_app/components/nav_bar.dart';
import 'package:luo3_app/models/user_models.dart';
import 'package:luo3_app/pages/auth/authenticate.dart';
import 'package:luo3_app/pages/onboarding/onboarding_first_page.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({super.key});

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  bool _isLoading = true;
  bool _hasCompletedOnboarding = false;

  @override
  void initState() {
    super.initState();
    _checkOnboardingStatus();
  }

  Future<void> _checkOnboardingStatus() async {
    final prefs = await SharedPreferences.getInstance();
    bool seen = prefs.getBool('hasCompletedOnboarding') ?? false;

    setState(() {
      _hasCompletedOnboarding = seen;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModels?>(context);

    if (_isLoading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    if (user == null) {
      return const Authenticate();
    } else {
      return _hasCompletedOnboarding
          ? const Luo3NavBar()
          : const OnboardingFirstScreen();
    }
  }
}
