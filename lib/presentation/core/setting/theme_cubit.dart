

import 'dart:developer';

import 'package:ddd_firebase/presentation/core/const/all_library.dart';



const String _spThemeKey = "app_theme";

class ThemeCubit extends Cubit<ThemeData> {
  ThemeCubit() : super(_getInitialTheme()) {
    _loadTheme();
  }

  static ThemeData _getInitialTheme() {
    return WidgetsBinding.instance.window.platformBrightness == Brightness.dark
        ? AppThemes.dark()
        : AppThemes.light();
  }

  /// Load theme preference from SharedPreferences
  Future<void> _loadTheme() async {
    final sp = await SharedPreferences.getInstance();
    final isLight = sp.getBool(_spThemeKey) ?? (state.brightness == Brightness.light);
    emit(isLight ? AppThemes.light() : AppThemes.dark());
  }

  /// Toggle and save the theme
  Future<void> toggleTheme() async {
    final isCurrentlyLight = state.brightness == Brightness.light;
    final newTheme = isCurrentlyLight ? AppThemes.dark() : AppThemes.light();
    emit(newTheme);

    final sp = await SharedPreferences.getInstance();
    await sp.setBool(_spThemeKey, !isCurrentlyLight);
    log("Theme saved as ${!isCurrentlyLight ? "Dark" : "Light"} in SharedPreferences");
  }
}
