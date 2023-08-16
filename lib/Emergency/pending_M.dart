import 'dart:convert';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:notify_app/Screens/Prescription.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

final Uri _url = Uri.parse('https://meet.google.com/gdj-uuof-qvm');

class Pending extends StatefulWidget {
  const Pending({Key? key}) : super(key: key);

  @override
  State<Pending> createState() => _PendingState();
}

class _PendingState extends State<Pending> {
  @override
  Widget build(BuildContext context) {
    Future<void> _launchUrl() async {
      String url = "https://meet.google.com/gdj-uuof-qvm";
      if (await canLaunchUrl(Uri.parse(url))) {
        await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
      }
    }

    List EmergencyOrders1 = [
      // {'DateTime': 'Dec 22, 2024 - 10:00 AM', 'Status': 'Link Generated'},
      {'DateTime': 'Dec 08, 2024 - 15:00 PM', 'Status': 'Pending'}
    ];
    return Container(
      child: FutureBuilder(
          future: SharedPreferences.getInstance(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              // var userinfo =
              //     json.decode(snapshot.data.getString('userinfo') as String);

              return Container(
                color: Colors.white,
                height: MediaQuery.of(context).size.height / 1.2,
                child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    padding: EdgeInsets.zero,
                    itemCount: EmergencyOrders1.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Material(
                          color: Colors.white,
                          shadowColor: Color(0xffBDBDBD),
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      EmergencyOrders1[index]['DateTime'],
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    Badge(
                                        toAnimate: false,
                                        shape: BadgeShape.square,
                                        badgeColor: EmergencyOrders1[index]
                                                    ['Status'] ==
                                                'Pending'
                                            ? Colors.green
                                            : Colors.blueGrey,
                                        borderRadius: BorderRadius.circular(8),
                                        badgeContent: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 5.0),
                                          child: Text(
                                            EmergencyOrders1[index]['Status'],
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        )),
                                  ],
                                ),
                              ),
                              ListTile(
                                title: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 5.0),
                                  child: Text(
                                    "userinfo['name']",
                                    style: TextStyle(
                                        color: Color(0xff212121),
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "userinfo['address']",
                                      style: TextStyle(
                                          color: Color(0xff757575),
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    if (EmergencyOrders1[index]['Status'] ==
                                        'Link Generated')
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8.0),
                                        child: SizedBox(
                                          width: EmergencyOrders1[index]
                                                      ['Status'] ==
                                                  'Link Generated'
                                              ? MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  1.3
                                              : MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  2.7,
                                          child: ElevatedButton(
                                            child: Text('Start Meeting',
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.black)),
                                            onPressed: () {
                                              _launchUrl();
                                              // ScaffoldMessenger.of(context)
                                              //     .showSnackBar(
                                              //   SnackBar(
                                              //     content: Text(
                                              //       "Link Copied Successfully! ",
                                              //       style: TextStyle(
                                              //           color: Colors.black),
                                              //     ),
                                              //     action: SnackBarAction(
                                              //         label: 'OK',
                                              //         textColor: Colors.black,
                                              //         onPressed: () {}),
                                              //     backgroundColor:
                                              //         Colors.grey[400],
                                              //   ),
                                              // );
                                            },
                                            style: ButtonStyle(
                                                shape: MaterialStateProperty.all<
                                                        RoundedRectangleBorder>(
                                                    RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          100),
                                                  side: BorderSide(
                                                      color: Colors.black,
                                                      width: 2.0),
                                                )),
                                                backgroundColor:
                                                    MaterialStateProperty.all(
                                                        Colors.white),
                                                padding:
                                                    MaterialStateProperty.all(
                                                        EdgeInsets.symmetric(
                                                            horizontal: 20))),
                                          ),
                                        ),
                                      ),
                                    if (EmergencyOrders1[index]['Status'] ==
                                        'Pending')
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8.0),
                                        child: SizedBox(
                                          width: EmergencyOrders1[index]
                                                      ['Status'] ==
                                                  'Pending'
                                              ? MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  1.3
                                              : MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  2.7,
                                          child: ElevatedButton(
                                            child: Text('View Prescription',
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.white)),
                                            onPressed: () {
                                              Navigator.of(context).pushNamed(
                                                  Prescription.routename);
                                            },
                                            style: ButtonStyle(
                                                shape: MaterialStateProperty.all<
                                                        RoundedRectangleBorder>(
                                                    RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          100),
                                                  side: BorderSide(
                                                      color: Colors.black,
                                                      width: 2.0),
                                                )),
                                                backgroundColor:
                                                    MaterialStateProperty.all(
                                                        Colors.black),
                                                padding:
                                                    MaterialStateProperty.all(
                                                        EdgeInsets.symmetric(
                                                            horizontal: 20))),
                                          ),
                                        ),
                                      )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    }),
              );
            } else
              return Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
                ),
              );
          }),
    );
  }
}
