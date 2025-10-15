import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:go_router/go_router.dart';
import 'firebase_options.dart';

import 'package:blk_app/screens/error_screen.dart';
import 'package:blk_app/screens/welcome_screen.dart';
import 'package:blk_app/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(BlkApp());
}

class BlkApp extends StatelessWidget {
  BlkApp({super.key});

  // Route configuration using GoRouter
  final _router = GoRouter(
    initialLocation: "/",
    routes: [GoRoute(path: "/", builder: (ctx, state) => WelcomeScreen())],
    errorBuilder: (ctx, state) => const ErrorScreen(),
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      // debugShowCheckedModeBanner: false,
      title: "BlkApp",
      routerConfig: _router,
      theme: getAppThemeData(kColorScheme),
      darkTheme: getAppThemeData(kDarkColorScheme),
      themeMode: ThemeMode.light,
    );
  }
}
