import 'package:flutter/material.dart';
import 'package:dhiravrana/constants.dart';
import 'package:dhiravrana/provider/themeProvider.dart';
import 'package:dhiravrana/widget/aboutMeMetaData.dart';
import 'package:dhiravrana/widget/adaptiveText.dart';
import 'package:dhiravrana/widget/communityIconBtn.dart';
import 'package:dhiravrana/widget/customBtn.dart';
import 'package:dhiravrana/widget/customTextHeading.dart';
import 'package:dhiravrana/widget/toolsTechWidget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'package:universal_html/html.dart' as html;

class AboutDesktop extends StatelessWidget {
  final _communityLogoHeight = [60.0, 70.0, 30.0];

  @override
  Widget build(BuildContext context) {
    final _themeProvider = Provider.of<ThemeProvider>(context);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.02,
      ),
      color: _themeProvider.lightTheme ? Colors.white : Colors.black,
      child: Column(
        children: [
          CustomSectionHeading(text: "\nAbout Me"),
          CustomSectionSubHeading(text: ""),
          SizedBox(height: 30.0),
          Row(
            children: [
              // Expanded(
              //   // child: Image.asset(
              //   //   '',
              //   //   height: height * 0.7,
              //   // ),
              // ),
              Expanded(
                flex: width < 1230 ? 2 : 1,
                child: Container(
                  padding: EdgeInsets.only(left: width < 1230 ? 25.0 : 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AdaptiveText(
                        "",
                        style: GoogleFonts.montserrat(
                            color: kPrimaryColor, fontSize: height * 0.025),
                      ),
                      SizedBox(
                        height: height * 0.03,
                      ),
                      AdaptiveText(
                        "Full Stack Software Engineer, AWS Cloud Developer & AWS trained devOps Engineer",
                        style: GoogleFonts.montserrat(
                          fontSize: height * 0.035,
                          fontWeight: FontWeight.w400,
                          color: _themeProvider.lightTheme
                              ? Colors.black
                              : Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      AdaptiveText(
                        "Computer Science, Engineering & all things tech",
                        style: GoogleFonts.montserrat(
                          fontSize: height * 0.02,
                          color: Colors.grey[500],
                          height: 2.0,
                        ),
                      ),
                      SizedBox(
                        height: height * 0.025,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border(
                            bottom:
                                BorderSide(color: Colors.grey.shade800, width: 2.0),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      AdaptiveText(
                        "Technologies I have worked with:",
                        style: GoogleFonts.montserrat(
                            color: kPrimaryColor, fontSize: height * 0.018),
                      ),
                      Row(
                        children: [
                          for (int i = 0; i < kTools.length; i++)
                            ToolTechWidget(
                              techName: kTools[i],
                            ),
                        ],
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border(
                            bottom:
                                BorderSide(color: Colors.grey.shade800, width: 2.0),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.025,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        // children: [
                        //   // AboutMeMetaData(
                        //   //   data: "Name",
                        //   //   information: "Dhirav Rana",
                        //   // ),
                        //   AboutMeMetaData(
                        //     data: "Email",
                        //     information: "dhiravrana@genesissouthafrica.net",
                        //   ),
                        // ],
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      Row(
                        // children: [
                        //   Padding(
                        //     padding: const EdgeInsets.all(8.0),
                        //     child: OutlinedCustomBtn(
                        //       onPressed: () {
                        //         html.window.open(
                        //             'https://drive.google.com/file/d/1GF-wtbu2ob_Uxhw2In2QA8QiYi3XjCj1/view?usp=sharing',
                        //             "pdf");
                        //       },
                        //       btnText: "Resume",
                        //     ),
                        //   ),
                        //   Container(
                        //     width: width * 0.05,
                        //     decoration: BoxDecoration(
                        //       border: Border(
                        //         bottom: BorderSide(
                        //             color: Colors.grey[900], width: 2.0),
                        //       ),
                        //     ),
                        //   ),
                        //   for (int i = 0; i < kCommunityLogo.length; i++)
                        //     CommunityIconBtn(
                        //       icon: kCommunityLogo[i],
                        //       link: kCommunityLinks[i],
                        //       height: _communityLogoHeight[i],
                        //     ),
                        // ],
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: width < 1230 ? width * 0.05 : width * 0.1,
              ),
            ],
          )
        ],
      ),
    );
  }
}
