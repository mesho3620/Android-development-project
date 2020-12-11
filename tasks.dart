import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_login_signup/src/bottom_bar.dart';
import 'package:flutter_login_signup/src/loginPage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'welcomePage.dart';
import 'package:percent_indicator/percent_indicator.dart';

class Tasks extends StatefulWidget {
  @override
  _TasksState createState() => _TasksState();
}

class _TasksState extends State<Tasks> {
  var value1 = false;
  var value2 = false;
  var value3 = false;
  var value4 = false;

  var _tasks_names = {
    [
      'Do dishes',
      'Play sports for an hour',
      'drink a cup of coffee',
      'wash your teeth',
      'visit your relatives',
    ]
  };

  var _tasks_types = {
    'daily',
    'weekly',
    'hobby',
    'habbit',
  };

  Widget _avatar_window() {
    return Row(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: 150,
          decoration: BoxDecoration(
            border: Border.all(width: 1),
            color: Colors.blue[200],
          ),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(children: [
                  GestureDetector(
                    child: Container(
                        margin: EdgeInsets.all(10),
                        width: 180,
                        height: 125,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            border: Border.all(width: 1),
                            image: DecorationImage(
                                image: AssetImage('assets/background/img1.png'),
                                fit: BoxFit.fill)),
                        child: Row(children: [
                          Image(
                            image: AssetImage('assets/avatar/hero1.png'),
                            width: 110,
                          ),
                          Image(
                            image: AssetImage('assets/pet/pet1.png'),
                            width: 60,
                          )
                        ])),
                    onTap: () {
                      // 7amzawy or Saeed put inventory path here
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    },
                  ),
                  Container(
                    width: 200,
                    height: 100,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          new LinearPercentIndicator(
                            width: 170.0,
                            lineHeight: 17.0,
                            percent: 0.8,
                            center: Text(
                              "80.0%",
                              style: new TextStyle(
                                  fontSize: 16.0, fontWeight: FontWeight.w900),
                            ),
                            leading: Icon(
                              Icons.favorite,
                              size: 30,
                              color: Colors.red,
                            ),
                            linearStrokeCap: LinearStrokeCap.roundAll,
                            backgroundColor: Colors.white,
                            progressColor: Colors.red,
                          ),
                          new LinearPercentIndicator(
                            width: 170.0,
                            lineHeight: 17.0,
                            percent: 0.288,
                            center: Text(
                              "28.8%",
                              style: new TextStyle(
                                  fontSize: 16.0, fontWeight: FontWeight.w900),
                            ),
                            leading: Icon(
                              Icons.menu_book,
                              size: 30,
                              color: Colors.blueAccent,
                            ),
                            linearStrokeCap: LinearStrokeCap.roundAll,
                            backgroundColor: Colors.white,
                            progressColor: Colors.blue,
                          ),
                          Column(children: [
                            Row(children: [
                              Icon(
                                Icons.mood_sharp,
                                color: Colors.blue,
                                size: 40,
                              ),
                              Text(
                                'Lvl : 7',
                                style: TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.w900),
                              ),
                              SizedBox(
                                width: 3,
                              ),
                              Icon(
                                Icons.monetization_on,
                                color: Colors.green,
                                size: 40,
                              ),
                              Text(
                                ' : 100',
                                style: TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.w900),
                              )
                            ]),
                          ])
                        ]),
                  )
                ])
              ]),
        ),
      ],
    );
  }

  Widget _add_task() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      width: MediaQuery.of(context).size.width - 3,
      height: 70,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(width: 1)),
      child: GestureDetector(
        child: IconButton(
          color: Colors.grey[800],
          icon: Icon(Icons.add_circle_outline),
          iconSize: 50,
          onPressed: () {
//Saeed put navigation to Add/Edit Screen here
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LoginPage()),
            );
          },
        ),
        onTap: () {
          //Saeed change navigation path to Add/Edit screen
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LoginPage()),
          );
        },
      ),
    );
  }

  Widget _daily() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      width: MediaQuery.of(context).size.width - 3,
      height: 70,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(width: 1)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: 52,
            height: 70,
            decoration: BoxDecoration(
                color: Colors.blue[700],
                borderRadius: BorderRadius.circular(5),
                border: Border.all(width: 1)),
            child: Checkbox(
              value: this.value1,
              onChanged: (bool value) {
                setState(() {
                  if (this.value1 = false) {
                    this.value1 = value;
                  }
                  if (this.value1 = true) {
                    this.value1 = value;
                  }
                });
              },
              checkColor: Colors.white,
              activeColor: Colors.black,
            ),
          ),
          GestureDetector(
              onTap: () {
                //Saeed change navigation path to Add/Edit screen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
              child: Container(
                width: 345,
                height: 70,
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(width: 1)),
                child: ListTile(
                  leading: Text(
                    'Do dishes',
                    style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
                    overflow: TextOverflow.ellipsis,
                  ),
                  subtitle: Text(
                    'Must be done before noon',
                    style: TextStyle(fontWeight: FontWeight.w900, fontSize: 19),
                    overflow: TextOverflow.ellipsis,
                  ),
                  trailing: IconButton(
                      icon: Icon(
                        Icons.close_rounded,
                        size: 50,
                        color: Colors.black,
                      ),
                      onPressed: null),
                ),
              )),
        ],
      ),
    );
  }

  Widget _weekly() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      width: MediaQuery.of(context).size.width - 3,
      height: 70,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(width: 1)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: 52,
            height: 70,
            decoration: BoxDecoration(
                color: Colors.green[700],
                borderRadius: BorderRadius.circular(5),
                border: Border.all(width: 1)),
            child: Checkbox(
              value: this.value2,
              onChanged: (bool value) {
                setState(() {
                  if (this.value2 = false) {
                    this.value2 = value;
                  }
                  if (this.value2 = true) {
                    this.value2 = value;
                  }
                });
              },
              checkColor: Colors.white,
              activeColor: Colors.black,
            ),
          ),
          GestureDetector(
              onTap: () {
                //Saeed change navigation path to Add/Edit screen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
              child: Container(
                width: 345,
                height: 70,
                decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(width: 1)),
                child: ListTile(
                  leading: Text(
                    'visit your relatives',
                    style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
                    overflow: TextOverflow.ellipsis,
                  ),
                  subtitle: Text(
                    'specially your aunt',
                    style: TextStyle(fontWeight: FontWeight.w900, fontSize: 15),
                    overflow: TextOverflow.ellipsis,
                  ),
                  trailing: IconButton(
                      icon: Icon(
                        Icons.close_rounded,
                        size: 50,
                        color: Colors.black,
                      ),
                      onPressed: null),
                ),
              )),
        ],
      ),
    );
  }

  Widget _habbits() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      width: MediaQuery.of(context).size.width - 3,
      height: 70,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(width: 1)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: 52,
            height: 70,
            decoration: BoxDecoration(
                color: Colors.orange[600],
                borderRadius: BorderRadius.circular(5),
                border: Border.all(width: 1)),
            child: Checkbox(
              value: this.value3,
              onChanged: (bool value) {
                setState(() {
                  if (this.value3 = false) {
                    this.value3 = value;
                  }
                  if (this.value3 = true) {
                    this.value3 = value;
                  }
                });
              },
              checkColor: Colors.white,
              activeColor: Colors.black,
            ),
          ),
          GestureDetector(
              onTap: () {
                //Saeed change navigation path to Add/Edit screen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
              child: Container(
                width: 345,
                height: 70,
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(width: 1)),
                child: ListTile(
                  leading: Text(
                    'drink a cup of coffee',
                    style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
                    overflow: TextOverflow.ellipsis,
                  ),
                  subtitle: Text(
                    'at least once, maximum 2 cups',
                    style: TextStyle(fontWeight: FontWeight.w900, fontSize: 15),
                    overflow: TextOverflow.ellipsis,
                  ),
                  trailing: IconButton(
                      icon: Icon(
                        Icons.close_rounded,
                        size: 50,
                        color: Colors.black,
                      ),
                      onPressed: null),
                ),
              )),
        ],
      ),
    );
  }

  Widget _hobbies() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      width: MediaQuery.of(context).size.width - 3,
      height: 70,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(width: 1)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: 52,
            height: 70,
            decoration: BoxDecoration(
                color: Colors.deepPurple[600],
                borderRadius: BorderRadius.circular(5),
                border: Border.all(width: 1)),
            child: Checkbox(
              value: this.value4,
              onChanged: (bool value) {
                setState(() {
                  if (this.value4 = false) {
                    this.value4 = value;
                  }
                  if (this.value4 = true) {
                    this.value4 = value;
                  }
                });
              },
              checkColor: Colors.white,
              activeColor: Colors.black,
            ),
          ),
          GestureDetector(
              onTap: () {
                //Saeed change navigation path to Add/Edit screen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
              child: Container(
                width: 345,
                height: 70,
                decoration: BoxDecoration(
                    color: Colors.blue[500],
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(width: 1)),
                child: ListTile(
                  leading: Text(
                    'Play sports for an hour',
                    style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
                    overflow: TextOverflow.ellipsis,
                  ),
                  subtitle: Text('50 crunches done at least',
                      overflow: TextOverflow.ellipsis,
                      style:
                          TextStyle(fontWeight: FontWeight.w900, fontSize: 15)),
                  trailing: IconButton(
                      icon: Icon(
                        Icons.close_rounded,
                        size: 50,
                        color: Colors.black,
                      ),
                      onPressed: null),
                ),
              )),
        ],
      ),
    );
  }

  Widget _task_list() {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          border: Border.all(width: 1),
          color: Colors.blue[300],
        ),
        height: 500,
        width: MediaQuery.of(context).size.width,
        child: ListView(children: [
          _daily(),
          SizedBox(
            height: 5,
          ),
          _weekly(),
          SizedBox(
            height: 5,
          ),
          _hobbies(),
          SizedBox(
            height: 5,
          ),
          _habbits(),
          SizedBox(
            height: 5,
          ),
          _add_task(),
        ]));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
      ),
      drawer: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20), bottomRight: Radius.circular(20)),
          border: Border.all(width: 1),
        ),
        width: 350,
        height: 730,
        child: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              Container(
                  height: 150,
                  child: DrawerHeader(
                    child: Text(
                      'Account Info',
                      style: TextStyle(fontSize: 30),
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(width: 1),
                      color: Colors.blue,
                    ),
                  )),
              ListTile(
                title: Text('Username: Ahmad Mostafa',
                    style: TextStyle(fontSize: 20)),
              ),
              ListTile(
                title: Text('User ID : 128903', style: TextStyle(fontSize: 20)),
              ),
              ListTile(
                title: Text('Logout', style: TextStyle(fontSize: 23)),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => WelcomePage()));
                },
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _avatar_window(),
            Container(height: 10, color: Colors.orange),
            _task_list(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //Saeed put path to home screen here
        },
        backgroundColor: Colors.deepOrange,
        child: Icon(Icons.home),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomBar(),
    );
  }
}
