import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.system;
  bool get isDarkMode {
    if (themeMode == ThemeMode.system) {
      return WidgetsBinding.instance.window.platformBrightness == Brightness.dark;
    }

    return themeMode == ThemeMode.dark;
  }
  void toggleTheme(bool isOn) {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

class CustomTheme {
  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.black,
    primaryColor: Colors.white,
    colorScheme: ColorScheme.light(),
    primaryIconTheme: IconThemeData(color: Color(0xFFFFC000)),
    brightness: Brightness.light,
  );

  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    primaryColor: Colors.black,
    colorScheme: ColorScheme.dark(),
    primaryIconTheme: IconThemeData(color: Color(0xE61B1D1C)),
    brightness: Brightness.dark,
  );
}
