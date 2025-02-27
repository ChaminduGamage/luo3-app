import 'package:flutter/material.dart';
import 'package:luo3_app/Theme/colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Column(
              children: [
                Container(
                  height: 500,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Luo3Colors.background,
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(200),
                    ),
                  ),
                  child: Image(
                    image: AssetImage('assets/images/Splash_Image.png'),
                  ),
                ),
              ],
            ),
            Container(
              child: Text(
                'The Smart Way to Rent Vehicles Around You!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  color: Luo3Colors.textPrimary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
