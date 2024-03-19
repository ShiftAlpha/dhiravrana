import 'package:flutter/material.dart';
import 'package:dhiravrana/provider/themeProvider.dart';
import 'package:provider/provider.dart';

class NavBarLogo extends StatelessWidget {
  final double? height;
  NavBarLogo({this.height});
  @override
  Widget build(BuildContext context) {
    final _themeProvider = Provider.of<ThemeProvider>(context);
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "> ",
              style: TextStyle(
                fontSize: height ?? 20,
                color: _themeProvider.lightTheme ? Colors.black : Colors.white,
              ),
            ),
            Text(
              "DHI",
              style: TextStyle(
                fontFamily: "Agustina",
                fontSize: height ?? 20,
                color: _themeProvider.lightTheme ? Colors.black : Colors.white,
              ),
            ),
            Text(
              " <",
              style: TextStyle(
                fontSize: height ?? 20,
                color: _themeProvider.lightTheme ? Colors.black : Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
