import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'notifications/LocalNotificationScreen.dart';
import 'inventory.dart';
import 'statistics.dart';
import 'addTask.dart';
import 'welcomePage.dart';
//
//
// import 'welcomePage.dart';
//
// void main() => runApp(MyApp());
//
// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     final textTheme = Theme.of(context).textTheme;
//     print('hehehe');
//     return MaterialApp(
//       title: 'Task Hero',
//       theme: ThemeData(
//         textTheme: GoogleFonts.latoTextTheme(textTheme).copyWith(
//           bodyText1: GoogleFonts.acme(textStyle: textTheme.bodyText1),
//         ),
//       ),
//       debugShowCheckedModeBanner: false,
//       home: SafeArea(
//         child: WelcomePage(),
//
//      // child: DonutAutoLabelChart.withSampleData(),
//      // child: MyCustomForm(),
//      // child: Inv(),
//       ),
//     );
//   }
// }
//
//

import 'package:flutter/material.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'notifications/LocalNotificationScreen.dart';

void main() async {
  runApp(HomeApp());
}

class HomeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return MaterialApp(
      title: 'Task Hero',
      theme: ThemeData(
        textTheme: GoogleFonts.latoTextTheme(textTheme).copyWith(
          bodyText1: GoogleFonts.acme(textStyle: textTheme.bodyText1),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final FirebaseMessaging _messaging = FirebaseMessaging();
  String userToken;

  @override
  void initState() {
    super.initState();

    _messaging.getToken().then((token) {
      print(token);
      userToken = token;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WelcomePage(),
    );
  }
}
