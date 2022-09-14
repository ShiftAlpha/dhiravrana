import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

// Colors
// const Color kPrimaryColor = Color(0xffC0392B);
const Color kPrimaryColor = Colors.green;

// Social Media
const kSocialIcons = [
  // "https://img.icons8.com/metro/208/ffffff/facebook-new--v2.png",
  // "https://img.icons8.com/ios-glyphs/480/ffffff/instagram-new.png",
  // "https://img.icons8.com/android/480/ffffff/twitter.png",
  "https://img.icons8.com/metro/308/ffffff/linkedin.png",
  "https://img.icons8.com/material-rounded/384/ffffff/github.png",
];

const kSocialLinks = [
  // "https://facebook.com/",
  // "https://instagram.com/",
  // "https://twitter.com/dhiravr",
  "https://linkedin.com/in/dhiravrana",
  "https://github.com/shiftAlpha",
];

// URL Launcher
void launchURL(String _url) async =>
    await canLaunch(_url) ? await launch(_url) : throw 'Could not launch $_url';

// Community
final kCommunityLogo = [
  'assets/cui.png',
  'assets/flutterIsl.png',
  'assets/dsc.png'
];

final kCommunityLinks = ["https://", "https://", "https://"];

// Tools & Tech
final kTools = [
  "Flutter",
  "Firebase",
  "Visual Studio Code",
  "Docker",
  "AWS",
  "GCP",
  "Visual Studio",
  "MS Azure",
  "Github",
  "DockerHub",
  "HCS",
];

// services
final kServicesIcons = [
  "assets/services/androidApp.png",
  "assets/services/CloudApp.png",
  "assets/services/blockchain.png",
  "assets/services/devOps.png",
  "assets/projects/flutter.png",
];

final kServicesTitles = [
  "Native App Development",
  "Cloud Development",
  "Web3 App Development",
  "DevOps",
  "Hybrid App Development",
  // "MS Azure",
  // "Google Cloud Platform",
  // "Smart Contracts "
  // "Hedera Hashgraph"
];

// final kServicesDescriptions = [
// ];

final kServicesDescriptions = [
  "Native app dev\n\n- Android Studio\n- Firebase/Firestore\n- AdminSDK",
  "Cloud dev\n\n- Amazon Web Services\n- Miscrosoft Azure\n- Google Cloud Platform",
  "Web3 app dev\n\n- Hedera HCS; Azure; \n  LedgerSDK; flutter \n- Ethereum; Truffle;\n  Ganache; Drizzle; react-native",
  "DevOps\n\n- Docker Cli\n- Github Cli; AWS; AWS Cli \n-Firebase Console \n-Google Cloud platform \n-codemagic.io (ios) \n",
  "Hybrid app dev\n\n- MERN \n- MEAN\n- Flutter ; Firebase/AWS Amplify\n- Visual Studio ; Azure",
];

final kServicesLinks = [
  "https:/",
  "https://",
  "https://",
  "https://",
  "https://github.com/shiftAlpha"
];

// projects
final kProjectsBanner = [
  "assets/services/",
  "assets/projects/",
  "assets/projects/",
  "assets/projects/",
];

final kProjectsIcons = [
  "assets/services/amazon.png",
  "assets/projects/flutter.png",
  "assets/services/blockchain.png",
  "assets/projects/",
  "assets/projects/",
  "assets/projects/",
  "assets/services/androidApp.png",
  "assets/projects/",
  "assets/projects/java.png",
  "assets/services/open.png",
];

final kProjectsTitles = [
  "Amazon Web Services",
  "Flutter Development",
  "Web3",
  "Cloud Development",
  "Security Development",
  "ASP.NET",
  "Android Development",
  "Web Development",
  "Java",
  "SQL",
];

final kProjectsDescriptions = [
  "Amazon Web Services Training",
  "Flutter apps",
  "Blockchain 2.0 & 3.0 Hashgraph projects",
  ".NET ; .CORE; Visual Studio MVC ;c# ",
  "(MEAN) C# web app showcasing security protocols ",
  "MVC; Forms; SQL Server Studio; ERD's",
  "Android projects utilizing android studio & firebase",
  "Web development technologies such as\n- HTML ; CSS ; JS\-n with a variety of JavaScript frameworks",
  "Java projects showcasing the fundementals of OOP \-nString Manipulation Etc",
  "SQL scripts incoporating CRUD functionality",
];

final kProjectsLinks = [
  "https://github.com/ShiftAlpha/AWS---DevOps-Cloud-Practitioner",
  "https://https://github.com/ShiftAlpha/FlutterBasic",
  "https://github.com/shiftAlpha/Ledger",
  "https://github.com/shiftAlpha/CLoud-Computing",
  "https://github.com/shiftAlpha/Advanced-App-Security",
  "https://github.com/shiftAlpha/Visual-Studio",
  "https://github.com/shiftAlpha/Android-Development",
  "https://github.com/shiftAlpha/CSS+HTML+JAVASCRIPT",
  "https://github.com/shiftAlpha/Java",
  "https://github.com/shiftAlpha/SQL",
];

// Contact
final kContactIcons = [
  Icons.meeting_room_outlined,
];

final kContactTitles = [
  "Location",
];

final kContactDetails = ["Calendly Meeting"];

final kContactLinks = [
  "https://calendly.com/dhiravrana",
];