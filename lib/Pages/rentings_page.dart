import 'package:flutter/material.dart';

class RentingsPage extends StatefulWidget {
  const RentingsPage({super.key});

  @override
  State<RentingsPage> createState() => _RentingsPageState();
}

class _RentingsPageState extends State<RentingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rentings Page'),
      ),
      body: const Center(
        child: Text(
          'Rentings Page Content',
        ),
      ),
    );
  }
}
