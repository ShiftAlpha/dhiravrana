import 'package:flutter/material.dart';
import 'package:dhiravrana/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class CommunityIconBtn extends StatelessWidget {
  final String? icon;
  final String? link;
  final double? height;

  const CommunityIconBtn({Key? key, this.icon, this.link, this.height});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: InkWell(
        child: Image.asset(
          icon!,
          height: height,
        ),
        onTap: () => launch(link!),
      ),
    );
  }
}
