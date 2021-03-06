import 'dart:io';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import '../bottom_bar.dart';
import '../loginPage.dart';
import '../addTask.dart';
import '../inventory.dart';
import 'package:google_fonts/google_fonts.dart';
import '../welcomePage.dart';
import 'package:percent_indicator/percent_indicator.dart';
import '../model/task_T.dart';
import '../components/task.dart';

class Tasks extends StatefulWidget {


  @override
  _TasksState createState() => _TasksState();
}

class _TasksState extends State<Tasks> {
  List<task_detail> mydata;

  Widget _avatar_window() {
    return Row(
      children: [
        Container(
          width: MediaQuery.of(context).size.width-3,
          height: 150,
          decoration: BoxDecoration(
            border: Border.all(width: 1),
            color: Colors.blue[100],
          ),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(children: [
                  GestureDetector(
                    child: Container(
                        margin: EdgeInsets.all(10),
                        width: MediaQuery.of(context).size.width * 0.45,
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
                        MaterialPageRoute(builder: (context) => Inv()),
                      );
                    },
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.48,
                    height: 100,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          new LinearPercentIndicator(
                            width: MediaQuery.of(context).size.width * 0.3,
                            lineHeight: 17.0,
                            percent: 0.8,
                            center: Text(
                              "80.0%",
                              style: new TextStyle(
                                  fontSize: 12.0, fontWeight: FontWeight.w900),
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
                            width: MediaQuery.of(context).size.width * 0.3,
                            lineHeight: 17.0,
                            percent: 0.288,
                            center: Text(
                              "28.8%",
                              style: new TextStyle(
                                  fontSize: 12.0, fontWeight: FontWeight.w900),
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
                                    fontSize: 20, fontWeight: FontWeight.w900),
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
                                    fontSize: 20, fontWeight: FontWeight.w900),
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
          border: Border.all(width: 2)),
      child: GestureDetector(
        child: IconButton(
          color: Colors.grey[800],
          icon: Icon(Icons.add_circle_outline),
          iconSize: 50,
          onPressed: () {
//Saeed put navigation to Add/Edit Screen here
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyCustomForm()),
            );
          },
        ),
        onTap: () {
          //Saeed change navigation path to Add/Edit screen
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MyCustomForm()),
          );
        },
      ),
    );
  }

  Widget _task_list(BuildContext context, List<task_detail> contact, CollectionReference Tasks) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          border: Border.all(width: 1),
          color: Colors.blue[300],
        ),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: _task_scroll(context, contact,Tasks));
  }

  Widget _task_scroll(BuildContext context, List<task_detail> taskD, CollectionReference Tasks) {
    return ListView(children: [
      _avatar_window(),
            Container(height: 10, color: Colors.orange),
      SizedBox(
        height: 5,
      ),
      ListView.builder(
        itemCount: taskD.length,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return task_details(
            taskdetail: taskD[index],
          );
        },
      ),
      _add_task(),





    ]);
  }

  @override
  Widget build(BuildContext context) {

    CollectionReference Tasks = Firestore.instance.collection('Tasks');

    return Scaffold(
      appBar: AppBar(),
      bottomNavigationBar: BottomBar(),
      floatingActionButton:
      FloatingActionButton(    backgroundColor: Colors.deepOrange,
          child: Icon(Icons.home), onPressed: () {}),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      drawer: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20), bottomRight: Radius.circular(20)),
          border: Border.all(width: 1),
        ),
        width: 250,
        height: MediaQuery.of(context).size.height * 0.9,
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
      // body: SafeArea(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.start,
      //     children: [
      //       _avatar_window(),
      //       Container(height: 10, color: Colors.orange),
      //       _task_list(),
      //     ],
      //   ),
      // ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     // Navigator.push(context, MaterialPageRoute(builder: (context) => Tasks()));
      //   },
      //   backgroundColor: Colors.deepOrange,
      //   child: Icon(Icons.home),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // bottomNavigationBar: BottomBar(),
      body: _buildBody(context,Tasks),

    );
  }
  Widget _buildBody(BuildContext context,CollectionReference Tasks) {
    return StreamBuilder<QuerySnapshot>(
      stream: Tasks.snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return LinearProgressIndicator();
        } else {
          int index=0;
          List<task_detail> contact = snapshot.data.documents
              .map((documentSnapshot) => task_detail.fromMap(documentSnapshot.data))
              .toList();

          return _task_list(context, contact,Tasks);
        }
      },
    );
  }
}
