import 'package:flutter/material.dart';

void main() {
  runApp(const BlkApp());
}

class BlkApp extends StatelessWidget {
  const BlkApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('BlkApp')),
        body: const Center(child: Text('Hello, BlkApp!')),
      ),
    );
  }
}
