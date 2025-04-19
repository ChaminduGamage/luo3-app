import 'package:flutter/material.dart';

class FindPage extends StatefulWidget {
  const FindPage({super.key});

  @override
  State<FindPage> createState() => _FindPageState();
}

class _FindPageState extends State<FindPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Find Page'),
      ),
      body: Center(
        child: const Text(
          'Find Page Content',
        ),
      ),
    );
  }
}
