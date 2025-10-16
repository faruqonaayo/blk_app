import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppModeNotifier extends Notifier<ThemeMode> {
  @override
  ThemeMode build() => ThemeMode.light;

  void toggleMode() {
    state = state == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
  }
}

final appModeProvider = NotifierProvider<AppModeNotifier, ThemeMode>(
  AppModeNotifier.new,
);
