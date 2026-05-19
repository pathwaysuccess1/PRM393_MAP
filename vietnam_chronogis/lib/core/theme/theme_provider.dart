import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError('Initialize this in main');
});

class ThemeNotifier extends StateNotifier<ThemeMode> {
  final SharedPreferences prefs;

  ThemeNotifier(this.prefs) : super(_loadThemeMode(prefs));

  static ThemeMode _loadThemeMode(SharedPreferences prefs) {
    final index = prefs.getInt('themeMode');
    if (index != null && index >= 0 && index < ThemeMode.values.length) {
      return ThemeMode.values[index];
    }
    return ThemeMode.dark;
  }

  void toggleTheme() {
    state = state == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    prefs.setInt('themeMode', state.index);
  }

  void setMode(ThemeMode mode) {
    state = mode;
    prefs.setInt('themeMode', mode.index);
  }
}

final themeProvider = StateNotifierProvider<ThemeNotifier, ThemeMode>((ref) {
  final prefs = ref.watch(sharedPreferencesProvider);
  return ThemeNotifier(prefs);
});
