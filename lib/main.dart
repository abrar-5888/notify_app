/* import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:notify_app/Screens/AddFamilyMembers.dart';
import 'package:notify_app/Screens/Complaint.dart';
import 'package:notify_app/Screens/Dashboard.dart';
import 'package:notify_app/Screens/E-Reciept.dart';
import 'package:notify_app/Screens/History.dart';
import 'package:notify_app/Screens/LoginPage.dart';
import 'package:notify_app/Screens/Prescription.dart';
import 'package:notify_app/Screens/Tab.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Screens/RequestLogin.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'Screens/Dashboard.dart';
import 'Screens/Profile.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //final FirebaseMessaging _fc = FirebaseMessaging.instance;
  bool _initialized = false;
  bool _error = false;

  void initializeFlutterFire() async {
    try {
      await Firebase.initializeApp();

      setState(() {
        _initialized = true;
      });
    } catch (e) {
      print(e);
      setState(() {
        _error = true;
      });
    }
  }

  @override
  void initState() {
    initializeFlutterFire();

    super.initState();
    //_fc.subscribeToTopic("Events");
  }

  @override
  Widget build(BuildContext context) {
    if (_error) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: AlertDialog(
            content: Text('Something went wrong. Please restart the app.'),
          ),
        ),
      );
    }
    if (!_initialized) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      );
    }
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        builder: EasyLoading.init(),
        title: 'Notify-App',
        theme: ThemeData(fontFamily: 'Urbanist'),
        home: FutureBuilder(
            future: SharedPreferences.getInstance(),
            builder: (context, AsyncSnapshot snapshot) {
              FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
              firebaseMessaging.subscribeToTopic('TopicToListen');
              if (snapshot.connectionState == ConnectionState.done) {
                return snapshot.data.containsKey("token")
                    ? snapshot.data.getBool("token")
                        ? TabsScreen()
                        : LoginScreen()
                    : LoginScreen();
              } else {
                return LoginScreen();
              }
            }),
        routes: {
          LoginScreen.routename: (ctx) => LoginScreen(),
          requestLoginPage.route: (ctx) => requestLoginPage(),
          Home.routeName: (ctx) => Home(),
          UserProfile.routename: (ctx) => UserProfile(),
          ButtonsHistory.routename: (ctx) => ButtonsHistory(),
          ViewEReciept.routename: (ctx) => ViewEReciept(),
          Prescription.routename: (ctx) => Prescription(),
          FamilyMembers.routename: (ctx) => FamilyMembers(),
          Complainform.routename: (ctx) => Complainform()
        });
  }
}

*/

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:notify_app/Screens/AddFamilyMembers.dart';
import 'package:notify_app/Screens/Complaint.dart';
import 'package:notify_app/Screens/Dashboard.dart';
import 'package:notify_app/Screens/E-Reciept.dart';
import 'package:notify_app/Screens/History.dart';
import 'package:notify_app/Screens/LoginPage.dart';
import 'package:notify_app/Screens/Prescription.dart';
import 'package:notify_app/Screens/Tab.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Screens/Profile.dart';
import 'Screens/RequestLogin.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      builder: EasyLoading.init(),
      title: 'Notify-App',
      theme: ThemeData(fontFamily: 'Urbanist'),
      home: FutureBuilder(
        future: SharedPreferences.getInstance(),
        builder: (context, AsyncSnapshot snapshot) {
          // Commented out Firebase subscription code
          // FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
          // firebaseMessaging.subscribeToTopic('TopicToListen');
          if (snapshot.connectionState == ConnectionState.done) {
            return snapshot.data.containsKey("token")
                ? snapshot.data.getBool("token")
                    ? TabsScreen()
                    : LoginScreen()
                : LoginScreen();
          } else {
            return LoginScreen();
          }
        },
      ),
      routes: {
        LoginScreen.routename: (ctx) => LoginScreen(),
        requestLoginPage.route: (ctx) => requestLoginPage(),
        Home.routeName: (ctx) => Home(),
        UserProfile.routename: (ctx) => UserProfile(),
        ButtonsHistory.routename: (ctx) => ButtonsHistory(),
        ViewEReciept.routename: (ctx) => ViewEReciept(),
        Prescription.routename: (ctx) => Prescription(),
        FamilyMembers.routename: (ctx) => FamilyMembers(),
        Complainform.routename: (ctx) => Complainform(),
        // ... Define other routes here
      },
    );
  }
}

