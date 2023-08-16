// import 'dart:convert';
// import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:notify_app/Emergency/Completed_M.dart';
import 'package:notify_app/Emergency/pending_M.dart';
// import 'package:notify_app/Screens/E-Reciept.dart';
import 'package:notify_app/Screens/LoginPage.dart';
// import 'package:notify_app/Screens/Prescription.dart';
import 'package:notify_app/Screens/Profile.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:url_launcher/url_launcher.dart';

// final Uri _url = Uri.parse('https://meet.google.com/gdj-uuof-qvm');

class Emergency extends StatelessWidget {
  const Emergency({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Future<void> _launchUrl() async {
    //   String url = "https://meet.google.com/gdj-uuof-qvm";
    //   if (await canLaunchUrl(Uri.parse(url))) {
    //     await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
    //   }
    // }

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Image(
              image: AssetImage('assets/Images/Lake-City-Logo.png'),
              height: 60,
              width: 60,
            ),
          ),
          title: Text(
            'Emergency',
            style: TextStyle(
                color: Color(0xff212121),
                fontWeight: FontWeight.w700,
                fontSize: 24),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.person,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    PageTransition(
                        duration: Duration(milliseconds: 700),
                        type: PageTransitionType.rightToLeftWithFade,
                        child: UserProfile()));
              },
            ),
            IconButton(
              icon: Icon(
                Icons.logout_rounded,
                color: Colors.black,
              ),
              onPressed: () async {
                var c = await SharedPreferences.getInstance();
                c.clear();
                Navigator.push(
                    context,
                    PageTransition(
                        duration: Duration(milliseconds: 700),
                        type: PageTransitionType.rightToLeftWithFade,
                        child: LoginScreen()));
              },
            ),
          ],
        ),
        body: Column(
          children: [
            TabBar(tabs: [
              Tab(
                child: Row(
                  children: [
                    Text(
                      "Pending Meetings",
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
              ),
              Tab(
                child: Text(
                  "Held Meetings",
                  style: TextStyle(color: Colors.black),
                ),
              )
            ]),
            Expanded(
              child: TabBarView(
                children: [
                  Container(
                    child: Pending(),
                  ),
                  Container(child: Completed_M())
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
