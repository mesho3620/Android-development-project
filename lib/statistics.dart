import 'package:flutter/material.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_circular_chart/flutter_circular_chart.dart';
import 'options(1).dart';
import 'main.dart';

class statistics extends StatelessWidget {
  // var data = [0.0, 1.0, 1.5, 2.0, 0.0, 0.0, -0.5, -1.0, -0.5, 0.0, 0.0];
  var data1 = [0.0,-2.0,3.5,-2.0,0.5,0.7,0.8,1.0,2.0,3.0,3.2];
  final GlobalKey<AnimatedCircularChartState> _chartKey = new GlobalKey<AnimatedCircularChartState>();
  List<CircularStackEntry> data = <CircularStackEntry>[
    new CircularStackEntry(
      <CircularSegmentEntry>[
        new CircularSegmentEntry(500.0, Colors.red[200], rankKey: 'Q1'),
        new CircularSegmentEntry(1000.0, Colors.green[200], rankKey: 'Q2'),
        new CircularSegmentEntry(2000.0, Colors.blue[200], rankKey: 'Q3'),
        new CircularSegmentEntry(1000.0, Colors.yellow[200], rankKey: 'Q4'),
      ],
      rankKey: 'Quarterly Profits',
    ),
  ];


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
                                    margin: new EdgeInsets.all(20),
                                    width: 350,
                                    // decoration: BoxDecoration(
                                    //     borderRadius: BorderRadius.all(
                                    //         Radius.circular(
                                    //             50.0) //                 <--- border radius here
                                    //     ),
                                    //     border: Border.all(
                                    //         color: Colors.black, width: 4)),
                                    // child: Row(
                                    //     mainAxisAlignment:
                                    //     MainAxisAlignment.spaceEvenly,
                                    //     // children: [
                                    //     //   Icon(Icons.block),
                                    //     //   Text('Daily Task 7'),
                                    //     //   Icon(Icons.check_box),
                                    //    // ]
                                    // )


                                    decoration: BoxDecoration(

                                        border: Border.all(
                                            color: Colors.black, width: 4)),
                                  child: new Sparkline(
                                    data: data1,
                                    lineColor:Color(0xffffff01),
                                    lineWidth: 2.0,
                                    pointsMode:PointsMode.all,
                                    pointSize: 8.0,
                                    fillMode: FillMode.below,
                                    fillGradient: new LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [Colors.amber[800], Colors.amber[200]],
                                    ),
                                  ),),
                              ],
                            ),
                            /*Row(
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
                                          // key: _chartKey,
                                          // size: const Size(300.0, 300.0),
                                          // initialChartData: data,
                                          // chartType: CircularChartType.Pie,
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
                            ),*/
                          ]),
                    )
                  ]))
        ]));
  }
}