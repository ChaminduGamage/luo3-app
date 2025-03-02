import 'package:flutter/material.dart';

// Custom Clipper Class
class CustomClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height * 0.8); // Start from bottom left
    path.quadraticBezierTo(size.width * 0.5, size.height * 0.95, size.width,
        size.height * 0.8); // Less curve
    path.lineTo(size.width, 0); // Top-right
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
