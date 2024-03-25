import 'package:flutter/material.dart';
import 'package:dhiravrana/animations/bottomAnimation.dart';
import 'package:dhiravrana/constants.dart';
import 'package:dhiravrana/provider/themeProvider.dart';
import 'package:dhiravrana/widget/adaptiveText.dart';
import 'package:dhiravrana/widget/customBtn.dart';
import 'package:dhiravrana/widget/footer.dart';
import 'package:dhiravrana/widget/socialMediaIcon.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:mailto/mailto.dart';
import 'package:url_launcher/url_launcher_string.dart';

class GetInTouchDesktop extends StatefulWidget {
  @override
  _GetInTouchDesktopState createState() => _GetInTouchDesktopState();
}

class _GetInTouchDesktopState extends State<GetInTouchDesktop> {
  final _msgController = TextEditingController();
  String _projectType = "";
  String _database = "";
  String _estBudget = "";
  String _projectDuration = "";

  List<String> projectType = [
    "",
    "",
    "",
    "",
    "",
  ];

  List<String> database = [
    "",
    "",
    "",
    ""
  ];

  List<String> estBudget = [
    
    "",
    "",
    "",
  ];

  List<String> projectDuration = [
    "",
    "",
    "",
    "",
  ];

  @override
  void dispose() {
    _msgController.dispose();
    super.dispose();
  }

  launchMailTo() async {
    final mailToLink = Mailto(
      to: ["dhiravrana@genesissouthafrica.net"],
      subject: _projectType,
      body: _msgController.text.isEmpty
          ? "Some message here"
          : _msgController.text,
    );

    // final mailUrl = "mailto:$mailToLink";
    try {
      await launchUrlString("$mailToLink");
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    final _themeProvider = Provider.of<ThemeProvider>(context);
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor:
            _themeProvider.lightTheme ? Colors.white : Colors.black,
        body: Stack(
          children: [
            Padding(
              padding:
                  const EdgeInsets.only(left: 50.0, right: 50.0, top: 35.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Icon(
                      Icons.arrow_back,
                      color: _themeProvider.lightTheme
                          ? Colors.black87
                          : Colors.white,
                      size: 35.0,
                    ),
                  ),
                  const SizedBox(height: 30.0),
                  Row(
                    children: [
                      Icon(
                        Icons.play_arrow_rounded,
                        color: kPrimaryColor,
                        size: 40.0,
                      ),
                    ],
                  ),
                  const SizedBox(height: 30.0),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            AdaptiveText(
                              "",
                              style: GoogleFonts.montserrat(
                                color: _themeProvider.lightTheme
                                    ? Colors.black
                                    : Colors.white,
                                fontSize: 14.0,
                              ),
                            ),
                            const SizedBox(height: 10.0),
                            Material(
                              color: Colors.white,
                              elevation: _themeProvider.lightTheme ? 4.0 : 0.0,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: DropdownButtonHideUnderline(
                                    child: DropdownButton(
                                  iconEnabledColor: Colors.black,
                                  value: _projectType,
                                  isExpanded: true,
                                  onChanged: (value) {
                                    setState(() {
                                      _projectType = value.toString();
                                    });
                                  },
                                  items: projectType
                                      .map(
                                        (type) => DropdownMenuItem(
                                          value: type,
                                          child: Text(
                                            type,
                                            style: GoogleFonts.montserrat(
                                              color: Colors.black,
                                              fontSize: 16.0,
                                            ),
                                          ),
                                        ),
                                      )
                                      .toList(),
                                )),
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(width: 50.0),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            AdaptiveText(
                              "",
                              style: GoogleFonts.montserrat(
                                color: _themeProvider.lightTheme
                                    ? Colors.black
                                    : Colors.white,
                                fontSize: 14.0,
                              ),
                            ),
                            const SizedBox(height: 10.0),
                            Material(
                              elevation: _themeProvider.lightTheme ? 4.0 : 0.0,
                              color: Colors.white,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: DropdownButtonHideUnderline(
                                    child: DropdownButton(
                                  iconEnabledColor: Colors.black,
                                  value: _database,
                                  isExpanded: true,
                                  onChanged: (value) {
                                    setState(() {
                                      _database = value.toString();
                                    });
                                  },
                                  items: database
                                      .map(
                                        (type) => DropdownMenuItem(
                                          value: type,
                                          child: Text(
                                            type,
                                            style: GoogleFonts.montserrat(
                                              color: Colors.black,
                                              fontSize: 16.0,
                                            ),
                                          ),
                                        ),
                                      )
                                      .toList(),
                                )),
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(width: 50.0),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            AdaptiveText(
                              "",
                              style: GoogleFonts.montserrat(
                                color: _themeProvider.lightTheme
                                    ? Colors.black
                                    : Colors.white,
                                fontSize: 14.0,
                              ),
                            ),
                            const SizedBox(height: 10.0),
                            Material(
                              elevation: _themeProvider.lightTheme ? 4.0 : 0.0,
                              color: Colors.white,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: DropdownButtonHideUnderline(
                                    child: DropdownButton(
                                  iconEnabledColor: Colors.black,
                                  value: _estBudget,
                                  isExpanded: true,
                                  onChanged: (value) {
                                    setState(() {
                                      _estBudget = value.toString();
                                    });
                                  },
                                  items: estBudget
                                      .map(
                                        (type) => DropdownMenuItem(
                                          value: type,
                                          child: Text(
                                            type,
                                            style: GoogleFonts.montserrat(
                                              color: Colors.black,
                                              fontSize: 16.0,
                                            ),
                                          ),
                                        ),
                                      )
                                      .toList(),
                                )),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8.0),
                  _projectType == ""
                      ? Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.info_outline_rounded,
                              color: kPrimaryColor,
                              size: 20.0,
                            ),
                            const SizedBox(width: 8.0),
                            AdaptiveText(
                              "",
                              style: TextStyle(
                                  color: _themeProvider.lightTheme
                                      ? Colors.black
                                      : Colors.white),
                            )
                          ],
                        )
                      : Container(),
                  const SizedBox(height: 50.0),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            AdaptiveText(
                              "",
                              style: GoogleFonts.montserrat(
                                color: _themeProvider.lightTheme
                                    ? Colors.black
                                    : Colors.white,
                                fontSize: 14.0,
                              ),
                            ),
                            const SizedBox(height: 15.0),
                            Material(
                              elevation: _themeProvider.lightTheme ? 4.0 : 0.0,
                              color: Colors.white,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: DropdownButtonHideUnderline(
                                    child: DropdownButton(
                                  iconEnabledColor: Colors.black,
                                  value: _projectDuration,
                                  isExpanded: true,
                                  onChanged: (value) {
                                    setState(() {
                                      _projectDuration = value.toString();
                                    });
                                  },
                                  items: projectDuration
                                      .map(
                                        (type) => DropdownMenuItem(
                                          value: type,
                                          child: Text(
                                            type,
                                            style: GoogleFonts.montserrat(
                                              color: Colors.black,
                                              fontSize: 16.0,
                                            ),
                                          ),
                                        ),
                                      )
                                      .toList(),
                                )),
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(width: 50.0),
                      Expanded(child: Container()),
                      const SizedBox(width: 50.0),
                      Expanded(child: Container()),
                    ],
                  ),
                  const SizedBox(height: 50.0),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AdaptiveText(
                              "Message:",
                              style: GoogleFonts.montserrat(
                                color: _themeProvider.lightTheme
                                    ? Colors.black
                                    : Colors.white,
                                fontSize: 14.0,
                              ),
                            ),
                            const SizedBox(height: 15.0),
                            TextField(
                              controller: _msgController,
                              keyboardType: TextInputType.multiline,
                              textInputAction: TextInputAction.newline,
                              maxLines: 7,
                              style: TextStyle(color: Colors.black),
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: _themeProvider.lightTheme
                                    ? Colors.grey[200]
                                    : Colors.white,
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 30.0),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  width: 150.0,
                                  height: 2.0,
                                  color: Colors.grey[800],
                                ),
                                const SizedBox(width: 5.0),
                                SizedBox(
                                  height: 40.0,
                                  width: 200,
                                  child: OutlinedCustomBtn(
                                    btnText: "Send",
                                    onPressed: () {
                                      launchURL(
                                          "mailto:");
                                    },
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(height: 50.0),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: List.generate(
                                kSocialIcons.length,
                                (index) => WidgetAnimator(
                                  child: SocialMediaIconBtn(
                                    icon: kSocialIcons[index],
                                    socialLink: kSocialLinks[index],
                                    height: MediaQuery.of(context).size.height *
                                        0.035,
                                    horizontalPadding:
                                        MediaQuery.of(context).size.width *
                                            0.005,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Expanded(child: Container()),
                ],
              ),
            ),
            Positioned(bottom: 0.0, child: Footer()),
          ],
        ),
      ),
    );
  }
}
