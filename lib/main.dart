import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
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
