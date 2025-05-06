import 'package:flutter/material.dart';

class VehicleDriverHomePage extends StatelessWidget {
  const VehicleDriverHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Vehicle Driver Home")),
      body: const Center(child: Text("Welcome Vehicle Driver Home!")),
    );
  }
}
