import 'package:flutter/material.dart';
import 'package:dhiravrana/constants.dart';

class ThemeStyles {
  static ThemeData themeData(bool lightTheme, BuildContext buildContext) {
    return lightTheme
        ?
        // Light Theme
        ThemeData(
            primarySwatch: Colors.green,
            primaryColorLight: kPrimaryColor,
            brightness: Brightness.light,
            primaryColor: kPrimaryColor,
            hintColor: Colors.black,
            highlightColor: Colors.black,
            canvasColor: Colors.white,
          )
        // Dark Theme
        : ThemeData(
            brightness: Brightness.dark,
            primarySwatch: Colors.green,
            primaryColorDark: kPrimaryColor,
            primaryColor: kPrimaryColor,
            hintColor: kPrimaryColor,
            highlightColor: kPrimaryColor,
            canvasColor: Colors.white,
          );
  }
}
