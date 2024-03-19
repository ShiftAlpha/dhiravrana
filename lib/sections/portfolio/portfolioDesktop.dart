import 'package:flutter/material.dart';
import 'package:dhiravrana/animations/bottomAnimation.dart';
import 'package:dhiravrana/widget/customBtn.dart';
import 'package:dhiravrana/widget/customTextHeading.dart';
import 'package:dhiravrana/widget/projectCard.dart';
import 'package:dhiravrana/constants.dart';
import 'package:url_launcher/url_launcher.dart'; // Import the url_launcher package

class PortfolioDesktop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    void launchURL() async {
      const url =
          'https://github.com/shiftAlpha'; // Replace with your desired URL
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    }

    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: width * 0.02, vertical: height * 0.02),
      child: Column(
        children: [
          CustomSectionHeading(text: "\nPortfolio"),
          CustomSectionSubHeading(text: "\n\n"),
          SizedBox(
            height: width > 1200 ? height * 0.45 : width * 0.21,
            child: ListView.separated(
              padding: EdgeInsets.symmetric(vertical: 20.0),
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) {
                return VerticalDivider(
                  color: Colors.transparent,
                  width: width * 0.015,
                );
              },
              itemBuilder: (context, index) {
                return ProjectCard(
                  cardWidth: width < 1200 ? width * 0.3 : width * 0.35,
                  cardHeight: width < 1200 ? height * 0.32 : height * 0.1,
                  projectIcon: kProjectsIcons[index],
                  projectTitle: kProjectsTitles[index],
                  projectDescription: kProjectsDescriptions[index],
                  projectLink: kProjectsLinks[index],
                );
              },
              itemCount: 4,
            ),
          ),
          SizedBox(height: height * 0.02),
          InkWell(
            onTap: () {
              launchURL(); // Call the launchURL function when tapped
            },
            child: OutlinedCustomBtn(
              btnText: "See More", onPressed: (){}),
            ),
        ],
      ),
    );
  }
}
