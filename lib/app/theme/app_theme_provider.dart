import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppThemeProvider extends ChangeNotifier {
  static const THEME_STATUS = "THEME_STATUS";

  setTheme(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(THEME_STATUS, value);
  }

  Future<bool> getTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(THEME_STATUS) ?? false;
  }

  late bool _isDark;

  bool get isDark => _isDark;

  AppThemeProvider() {
    _isDark = false;
    getPreferences();
  }

  //Switching themes in the flutter apps - Flutterant
  set isDark(bool value) {
    _isDark = value;
    setTheme(value);
    notifyListeners();
  }

  getPreferences() async {
    _isDark = await getTheme();
    notifyListeners();
  }
}
