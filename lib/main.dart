import 'dart:io';
import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'dailies.dart';
import 'options(1).dart';
import 'package:social_share_plugin/social_share_plugin.dart';

void main() {
  runApp(MaterialApp(
    title: 'Navigation Basics',
    home: Sign_In(),
  ));
}

class Sign_In extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.lightBlue[300],
        body:
        Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Text(
            'TASK HERO',
            textScaleFactor: 2.5,
            style: TextStyle(
                fontWeight: FontWeight.w900, color: Colors.deepPurple[500]),
          ),
          new Container(
            decoration: BoxDecoration(
                color: Colors.yellow,
                border: Border.all(width: 3, color: Colors.black)),
            width: 600,
            height: 225,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Please enter your email address',
                    textScaleFactor: 1.5,
                  ),
                  TextField(
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(hintText: 'Email'),
                  ),
                  Text(
                    'Please enter your Password',
                    textScaleFactor: 1.5,
                  ),
                  TextField(
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(hintText: 'Password'),
                  ),
                ]),
          ),
          RaisedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Dailies()),
                );
              },
              highlightColor: Colors.yellow[400],
              padding: const EdgeInsets.all(0.0),
              child: Text('Login')),
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            IconButton(
              icon: Icon(
                Icons.power_settings_new_rounded,
                color: Colors.black,
                size: 50.0,
                semanticLabel: 'Text to announce in accessibility modes',
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => exit(0)),
                );
              },
            ),
            IconButton(
              icon: Icon(
                Icons.settings,
                color: Colors.black,
                size: 50.0,
                semanticLabel: 'Text to announce in accessibility modes',
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Options_1()),
                );
              },
            ),
          ])
        ]),
      ),
    );
  }
}

/*  child: Column(children: [
            Text('TASK HERO'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => dailies()),
                );
              },
              child: Text('Login'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => options_1()),
                );
              },
              child: Text('options'),
            ),
            Icon(
              Icons.power_settings_new_rounded,
              color: Colors.black,
              size: 24.0,
              semanticLabel: 'Text to announce in accessibility modes',
            ),
          ]), */
