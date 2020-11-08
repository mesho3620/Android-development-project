import 'package:flutter/material.dart';
import 'dailies.dart';
import 'main.dart';

class Options_1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.lightBlue[300],
        body: Container(
          decoration:
              BoxDecoration(border: Border.all(width: 3, color: Colors.black)),
          padding: new EdgeInsets.symmetric(vertical: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              new Container(
                decoration: BoxDecoration(
                    color: Colors.yellow[300],
                    border: Border.all(width: 3, color: Colors.black)),
                width: 600,
                height: 80,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Account',
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          decorationThickness: 5),
                    ),
                    new GestureDetector(
                      onTap: () {},
                      child: new Text("Permission"),
                    ),
                    new GestureDetector(
                      onTap: () {},
                      child: new Text("Notifications"),
                    ),
                  ],
                ),
              ),
              new Container(
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    border: Border.all(width: 3, color: Colors.black)),
                width: 600,
                height: 500,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('Clear User Data : '),
                        Text('Link Emails : '),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Warning,clearing your \n account data \n means restarting over again \n with a new avatar,\n  inventory and achievments ',
                          style:
                              TextStyle(color: Colors.red[400], fontSize: 19),
                        ),
                        RaisedButton(
                            onPressed: () {},
                            highlightColor: Colors.orange[400],
                            padding: const EdgeInsets.all(0.0),
                            color: Colors.red,
                            textColor: Colors.white,
                            child: Text('Clear')),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            IconButton(
                                icon: Image.asset(
                                  "assets/icons/FLogo.png",
                                ),
                                onPressed: () {}),
                            IconButton(
                                icon: Image.asset(
                                  "assets/icons/TLogo.png",
                                ),
                                onPressed: () {}),
                            IconButton(
                                icon: Image.asset(
                                  "assets/icons/GLogo.png",
                                ),
                                onPressed: () {}),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              IconButton(
                icon: Icon(
                  Icons.keyboard_return_rounded,
                  color: Colors.black,
                  size: 60.0,
                  semanticLabel: 'Text to announce in accessibility modes',
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Sign_In()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
