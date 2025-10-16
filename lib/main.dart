import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'firebase_options.dart';

import 'package:blk_app/theme.dart';
import 'package:blk_app/screens/error_screen.dart';
import 'package:blk_app/screens/auth_welcome_screen.dart';
import 'package:blk_app/providers/app_mode_provider.dart';
import 'package:blk_app/screens/app_layout.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(ProviderScope(child: BlkApp()));
}

class BlkApp extends ConsumerWidget {
  BlkApp({super.key});

  // Route configuration using GoRouter
  final _router = GoRouter(
    initialLocation: "/auth",
    routes: [
      GoRoute(
        path: "/app/:tab",
        builder: (ctx, state) => AppLayout(
          initialPage: int.parse(state.pathParameters["tab"] ?? "0"),
        ),
      ),
      GoRoute(path: "/auth", builder: (ctx, state) => AuthWelcomeScreen()),
    ],
    redirect: (context, state) {
      final isLoggedIn = FirebaseAuth.instance.currentUser != null;
      if (!isLoggedIn) {
        return "/auth";
      }
      return "/app/0";
    },
    errorBuilder: (ctx, state) => const ErrorScreen(),
  );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appMode = ref.watch(appModeProvider);

    return MaterialApp.router(
      // debugShowCheckedModeBanner: false,
      title: "BlkApp",
      routerConfig: _router,
      theme: getAppThemeData(kColorScheme),
      darkTheme: getAppThemeData(kDarkColorScheme),
      themeMode: appMode,
    );
  }
}
