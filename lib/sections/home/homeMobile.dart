import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:dhiravrana/constants.dart';
import 'package:dhiravrana/provider/themeProvider.dart';
import 'package:dhiravrana/widget/socialMediaIcon.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeMobile extends StatefulWidget {
  @override
  _HomeMobileState createState() => _HomeMobileState();
}

class _HomeMobileState extends State<HomeMobile> {
  @override
  Widget build(BuildContext context) {
    final _themeProvider = Provider.of<ThemeProvider>(context);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Container(
      height: height,
      width: width,
      child: Stack(
        children: [
          Positioned(
            bottom: 5,
            // left: 2,
            right: 0.01,
            child: Opacity(
              opacity: 0.9,
              child: Image.asset('assets/dp.jpg', height: height * 0.75),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(width * 0.07, height * 0.12, 0, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  // children: [
                  //   Text(
                  //     "Hello World! ",
                  //     style: GoogleFonts.montserrat(
                  //         fontSize: height * 0.025,
                  //         color: _themeProvider.lightTheme
                  //             ? Colors.black
                  //             : Colors.white,
                  //         fontWeight: FontWeight.w200),
                  //   ),
                  //   Image.asset(
                  //     "assets/hi.gif",
                  //     height: height * 0.03,
                  //   ),
                  // ],
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Text(
                  "Dhirav Rana",
                  style: GoogleFonts.montserrat(
                      fontSize: height * 0.055,
                      color: _themeProvider.lightTheme
                          ? Colors.black
                          : Colors.white,
                      fontWeight: FontWeight.w100,
                      letterSpacing: 1.1),
                ),
                // Text(
                //   "Rana",
                //   style: GoogleFonts.montserrat(
                //       color: _themeProvider.lightTheme
                //           ? Colors.black
                //           : Colors.white,
                //       fontSize: height * 0.055,
                //       fontWeight: FontWeight.w500),
                // ),
                SizedBox(
                  height: height * 0.01,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.play_arrow_rounded,
                      color: kPrimaryColor,
                    ),
                    FadeAnimatedTextKit(
                        isRepeatingAnimation: true,
                        // duration: Duration(milliseconds: 100),
                        textStyle: GoogleFonts.montserrat(
                            fontSize: height * 0.03,
                            color: _themeProvider.lightTheme
                                ? Colors.black
                                : Colors.white,
                            fontWeight: FontWeight.w200),
                        text: [
                          "Full Stack Developer",
                          "Web3/Hashgraph",
                          "DevOps"
                        ]),
                  ],
                ),
                SizedBox(
                  height: height * 0.035,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    for (int i = 0; i < kSocialIcons.length; i++)
                      SocialMediaIconBtn(
                        icon: kSocialIcons[i],
                        socialLink: kSocialLinks[i],
                        height: height * 0.03,
                        horizontalPadding: 2.0,
                      )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
