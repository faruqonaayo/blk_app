import 'package:flutter/material.dart';

import 'package:blk_app/screens/auth_screen.dart';
import 'package:blk_app/screens/welcome_screen.dart';

class AuthWelcomeScreen extends StatefulWidget {
  const AuthWelcomeScreen({super.key});

  @override
  State<AuthWelcomeScreen> createState() => _AuthWelcomeScreenState();
}

class _AuthWelcomeScreenState extends State<AuthWelcomeScreen> {
  late PageController _pageController;
  final _pages = const [WelcomeScreen(), AuthScreen()];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(controller: _pageController, children: _pages),
    );
  }
}
