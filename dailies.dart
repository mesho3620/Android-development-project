import 'package:flutter/material.dart';
import 'options(1).dart';
import 'main.dart';
import 'package:percent_indicator/percent_indicator.dart';

class Dailies extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          backgroundColor: Colors.lightBlue[300],
          body: Center(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                color: Colors.white,
                child: Row(children: [
                  Image(
                    image: AssetImage('assets/characters/Hero/Hero1.jpg'),
                    fit: BoxFit.fill,
                    height: 200,
                    width: 180,
                  ),
                  Image(
                    image: AssetImage('assets/characters/Pet/Pet1.png'),
                    fit: BoxFit.fill,
                    height: 100,
                    width: 80,
                  ),
                  Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        new LinearPercentIndicator(
                          width: 115.0,
                          lineHeight: 17.0,
                          percent: 0.8,
                          center: Text(
                            "80.0%",
                            style: new TextStyle(fontSize: 12.0),
                          ),
                          trailing: Icon(
                            Icons.favorite,
                            color: Colors.red,
                          ),
                          linearStrokeCap: LinearStrokeCap.roundAll,
                          backgroundColor: Colors.grey,
                          progressColor: Colors.red,
                        ),
                        new LinearPercentIndicator(
                          width: 115.0,
                          lineHeight: 17.0,
                          percent: 0.738,
                          center: Text(
                            "73.8%",
                            style: new TextStyle(fontSize: 12.0),
                          ),
                          trailing: Text('EXP'),
                          linearStrokeCap: LinearStrokeCap.roundAll,
                          backgroundColor: Colors.grey,
                          progressColor: Colors.blue,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.mood,
                              color: Colors.green,
                            ),
                            Icon(Icons.mood_bad, color: Colors.red),
                            Icon(Icons.mood_sharp, color: Colors.blue),
                          ],
                        ),
                        Text(
                          'Lvl 7',
                          style: TextStyle(fontSize: 30),
                        )
                      ]),
                ]),
              ),
              Scroll_Tab(),
              Scroll_Task(),
              BottomAppBar(
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.settings,
                        color: Colors.black,
                        size: 50.0,
                        semanticLabel:
                            'Text to announce in accessibility modes',
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Options_1()),
                        );
                      },
                    ),
                    IconButton(
                        icon: Icon(
                          Icons.exit_to_app_rounded,
                          color: Colors.black,
                          size: 50.0,
                          semanticLabel:
                              'Text to announce in accessibility modes',
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Sign_In()),
                          );
                        }),
                  ],
                ),
              )
            ],
          ))),
    );
  }
}

class Scroll_Task extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 400,
        color: Colors.indigo,
        child:
            ListView(reverse: true, scrollDirection: Axis.vertical, children: [
          Card(
              color: Colors.lightBlue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0),
              ),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(
                                  50.0) //                 <--- border radius here
                              ),
                          border: Border.all(color: Colors.black, width: 4)),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                    margin: new EdgeInsets.all(5),
                                    width: 350,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(
                                                50.0) //                 <--- border radius here
                                            ),
                                        border: Border.all(
                                            color: Colors.black, width: 4)),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Icon(Icons.block),
                                          Text('Daily Task 1'),
                                          Icon(Icons.check_box),
                                        ])),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                    margin: new EdgeInsets.all(5),
                                    width: 350,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(
                                                50.0) //                 <--- border radius here
                                            ),
                                        border: Border.all(
                                            color: Colors.black, width: 4)),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Icon(Icons.block),
                                          Text('Daily Task 1'),
                                          Icon(Icons.check_box),
                                        ])),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                    margin: new EdgeInsets.all(5),
                                    width: 350,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(
                                                50.0) //                 <--- border radius here
                                            ),
                                        border: Border.all(
                                            color: Colors.black, width: 4)),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Icon(Icons.block),
                                          Text('Daily Task 1'),
                                          Icon(Icons.check_box),
                                        ])),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                    margin: new EdgeInsets.all(5),
                                    width: 350,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(
                                                50.0) //                 <--- border radius here
                                            ),
                                        border: Border.all(
                                            color: Colors.black, width: 4)),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Icon(Icons.block),
                                          Text('Daily Task 1'),
                                          Icon(Icons.check_box),
                                        ])),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                    margin: new EdgeInsets.all(5),
                                    width: 350,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(
                                                50.0) //                 <--- border radius here
                                            ),
                                        border: Border.all(
                                            color: Colors.black, width: 4)),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Icon(Icons.block),
                                          Text('Daily Task 1'),
                                          Icon(Icons.check_box),
                                        ])),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                    margin: new EdgeInsets.all(5),
                                    width: 350,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(
                                                50.0) //                 <--- border radius here
                                            ),
                                        border: Border.all(
                                            color: Colors.black, width: 4)),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Icon(Icons.block),
                                          Text('Daily Task 1'),
                                          Icon(Icons.check_box),
                                        ])),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                    margin: new EdgeInsets.all(5),
                                    width: 350,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(
                                                50.0) //                 <--- border radius here
                                            ),
                                        border: Border.all(
                                            color: Colors.black, width: 4)),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Icon(Icons.block),
                                          Text('Daily Task 1'),
                                          Icon(Icons.check_box),
                                        ])),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                    margin: new EdgeInsets.all(5),
                                    width: 350,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(
                                                50.0) //                 <--- border radius here
                                            ),
                                        border: Border.all(
                                            color: Colors.black, width: 4)),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Icon(Icons.block),
                                          Text('Daily Task 1'),
                                          Icon(Icons.check_box),
                                        ])),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                    margin: new EdgeInsets.all(5),
                                    width: 350,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(
                                                50.0) //                 <--- border radius here
                                            ),
                                        border: Border.all(
                                            color: Colors.black, width: 4)),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Icon(Icons.block),
                                          Text('Daily Task 1'),
                                          Icon(Icons.check_box),
                                        ])),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                    margin: new EdgeInsets.all(5),
                                    width: 350,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(
                                                50.0) //                 <--- border radius here
                                            ),
                                        border: Border.all(
                                            color: Colors.black, width: 4)),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Icon(Icons.block),
                                          Text('Daily Task 1'),
                                          Icon(Icons.check_box),
                                        ])),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                    margin: new EdgeInsets.all(5),
                                    width: 350,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(
                                                50.0) //                 <--- border radius here
                                            ),
                                        border: Border.all(
                                            color: Colors.black, width: 4)),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Icon(Icons.block),
                                          Text('Daily Task 1'),
                                          Icon(Icons.check_box),
                                        ])),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                    margin: new EdgeInsets.all(5),
                                    width: 350,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(
                                                50.0) //                 <--- border radius here
                                            ),
                                        border: Border.all(
                                            color: Colors.black, width: 4)),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Icon(Icons.block),
                                          Text('Daily Task 1'),
                                          Icon(Icons.check_box),
                                        ])),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                    margin: new EdgeInsets.all(5),
                                    width: 350,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(
                                                50.0) //                 <--- border radius here
                                            ),
                                        border: Border.all(
                                            color: Colors.black, width: 4)),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Icon(Icons.block),
                                          Text('Daily Task 1'),
                                          Icon(Icons.check_box),
                                        ])),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                    margin: new EdgeInsets.all(5),
                                    width: 350,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(
                                                50.0) //                 <--- border radius here
                                            ),
                                        border: Border.all(
                                            color: Colors.black, width: 4)),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Icon(Icons.block),
                                          Text('Daily Task 1'),
                                          Icon(Icons.check_box),
                                        ])),
                              ],
                            ),
                          ]),
                    )
                  ]))
        ]));
  }
}

class Scroll_Tab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
          child: Container(
        height: 30,
        color: Colors.yellow,
        child: ListView(scrollDirection: Axis.horizontal, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                  margin: new EdgeInsets.symmetric(horizontal: 25),
                  child: new GestureDetector(
                    onTap: () {},
                    child: new Text("Daily"),
                  )),
              Container(
                  margin: new EdgeInsets.symmetric(horizontal: 25),
                  child: new GestureDetector(
                    onTap: () {},
                    child: new Text("Weekly"),
                  )),
              Container(
                  margin: new EdgeInsets.symmetric(horizontal: 25),
                  child: new GestureDetector(
                    onTap: () {},
                    child: new Text("Hobbies"),
                  )),
              Container(
                  margin: new EdgeInsets.symmetric(horizontal: 25),
                  child: new GestureDetector(
                    onTap: () {},
                    child: new Text("Habits"),
                  )),
              Container(
                  margin: new EdgeInsets.symmetric(horizontal: 25),
                  child: new GestureDetector(
                    onTap: () {},
                    child: new Text("Shop"),
                  )),
              Container(
                  margin: new EdgeInsets.symmetric(horizontal: 25),
                  child: new GestureDetector(
                    onTap: () {},
                    child: new Text("Party"),
                  )),
              Container(
                  margin: new EdgeInsets.symmetric(horizontal: 25),
                  child: new GestureDetector(
                    onTap: () {},
                    child: new Text("Statistics"),
                  )),
              Container(
                  margin: new EdgeInsets.symmetric(horizontal: 25),
                  child: new GestureDetector(
                    onTap: () {},
                    child: new Text("Mood"),
                  )),
              Container(
                  margin: new EdgeInsets.symmetric(horizontal: 25),
                  child: new GestureDetector(
                    onTap: () {},
                    child: new Text("Inventory"),
                  )),
            ],
          )
        ]),
      )),
    );
  }
}
