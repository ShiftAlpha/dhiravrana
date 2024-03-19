import 'package:shared_preferences/shared_preferences.dart';

class ThemePreference {
  // ignore: constant_identifier_names
  static const THEME_STATUS = "THEMESTATUS";
  // ignore: constant_identifier_names
  static const FONT_SIZE = "FONTSIZE";

  setDarkTheme(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(THEME_STATUS, value);
  }

  Future<bool> getTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(THEME_STATUS) ?? false;
  }
}
