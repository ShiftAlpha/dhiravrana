import 'package:flutter/material.dart';
import 'package:dhiravrana/constants.dart';
import 'package:dhiravrana/provider/themeProvider.dart';
import 'package:dhiravrana/widget/adaptiveText.dart';
import 'package:provider/provider.dart';

class ToolTechWidget extends StatelessWidget {
  final String? techName;

  const ToolTechWidget({Key? key, this.techName}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _themeProvider = Provider.of<ThemeProvider>(context);
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.0),
      child: Row(
        children: [
          Icon(
            Icons.arrow_right_rounded,
            color: kPrimaryColor,
            size: MediaQuery.of(context).size.height * 0.02,
          ),
          AdaptiveText(
            " $techName ",
            style: TextStyle(
              color:
                  _themeProvider.lightTheme ? Colors.grey[500] : Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
