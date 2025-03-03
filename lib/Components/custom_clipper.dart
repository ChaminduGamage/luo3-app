import 'package:flutter/material.dart';
import 'package:luo3_app/Theme/colors.dart';

class ClipPathWidgets extends StatelessWidget {
  final String imageAsset;

  const ClipPathWidgets({super.key, required this.imageAsset});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CustomClipPath(),
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.65,
        decoration: const BoxDecoration(color: Luo3Colors.background),
        child: Image(
          image: AssetImage(imageAsset),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

// Custom Clipper Class
class CustomClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height * 0.8);
    path.quadraticBezierTo(
        size.width * 0.5, size.height * 0.95, size.width, size.height * 0.8);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
