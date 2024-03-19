import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dhiravrana/constants.dart';
import 'package:dhiravrana/widget/customBtn.dart';
import 'package:dhiravrana/widget/customTextHeading.dart';
import 'package:dhiravrana/widget/projectCard.dart';
import 'package:url_launcher/url_launcher.dart';

class PortfolioMobileTab extends StatelessWidget {
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
      child: Column(
        children: [
          CustomSectionHeading(text: "\nPortfolio"),
          CustomSectionSubHeading(text: "\n\n"),
          CarouselSlider.builder(
            itemCount: 10,
            itemBuilder: (BuildContext context, int itemIndex, int i) =>
                Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: ProjectCard(
                cardWidth: width < 650 ? width * 0.8 : width * 0.4,
                projectIcon: kProjectsIcons[i],
                projectTitle: kProjectsTitles[i],
                projectDescription: kProjectsDescriptions[i],
                projectLink: kProjectsLinks[i],
              ),
            ),
            options: CarouselOptions(
              height: height * 0.4,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 5),
              enlargeCenterPage: true,
              autoPlayCurve: Curves.fastOutSlowIn,
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              enableInfiniteScroll: false,
            ),
          ),
          SizedBox(height: height * 0.03),
          InkWell(
            onTap: () {
              launchURL(); // Call the launchURL function when tapped
            },
            child: OutlinedCustomBtn(btnText: "See More", onPressed: () {}),
          ),
        ],
      ),
    );
  }
}
