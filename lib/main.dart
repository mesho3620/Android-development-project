import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'inventory.dart';
import 'statistics.dart';
import 'addTask.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/services.dart';
import 'welcomePage.dart';
import 'package:flutter/foundation.dart';
import 'dart:async';
import 'dart:io';

void _enablePlatformOverrideForDesktop() {
  if (!kIsWeb && (Platform.isWindows || Platform.isLinux)) {
    debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;
  }
}

void main() {
  _enablePlatformOverrideForDesktop();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  Future<bool> check() async {
    var connResult = await (Connectivity().checkConnectivity());
    if (connResult == ConnectivityResult.mobile) {
      return true;
    } else if (connResult == ConnectivityResult.wifi) {
      return true;
    }
    return false;
  }

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
      home: SafeArea(
        child: MyHomePage(),
        // child: DonutAutoLabelChart.withSampleData(),
        // child: MyCustomForm(),
        // child: Inv(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _connectionStatus = 'Unknown';
  final Connectivity _connectivity = Connectivity();
  StreamSubscription<ConnectivityResult> _connectivitySubscription;

  @override
  void initState() {
    super.initState();
    initConnectivity();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initConnectivity() async {
    ConnectivityResult result = ConnectivityResult.none;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      print(e.toString());
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) {
      return Future.value(null);
    }

    return _updateConnectionStatus(result);
  }

  var check = true;

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    switch (result) {
      case ConnectivityResult.wifi:
        setState(() {
          check = true;
        });
        return;
      case ConnectivityResult.mobile:
        setState(() {
          check = true;
        });
        return;
      case ConnectivityResult.none:
        check = false;
        setState(() => _connectionStatus = result.toString());
        return;
      default:
        setState(() => _connectionStatus = 'Failed to get connectivity.');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (check == false) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Connection Error'),
        ),
        body: Center(
            child: Text(
          'Connection Status: No WiFi or Mobile Data ',
          style: TextStyle(fontSize: 20),
        )),
      );
    } else if (check == true) {
      return Scaffold(body: WelcomePage());
    }
    return null;
  }
}
