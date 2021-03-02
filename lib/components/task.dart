import 'package:flutter/material.dart';
import '../addTask(1).dart';

class task_details extends StatefulWidget {
  String taskname;
  String tasknotes;
  String tasktype;
  String taskdifficulty;
  String dateDay;
  String dateMonth;
  bool visible = true;
  task_details(
      {@required this.taskname,
      @required this.tasknotes,
      @required this.tasktype,
      @required this.taskdifficulty,
      @required this.dateDay,
      @required this.dateMonth});
  @override
  _taskDetailsState createState() => _taskDetailsState();
}

class _taskDetailsState extends State<task_details> {
  var value1 = false;
  var value2 = false;
  var value3 = false;
  var value4 = false;

  @override
  Widget build(BuildContext context) {
    if (widget.visible == true) {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 5),
        width: MediaQuery.of(context).size.width - 3,
        height: 70,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
            border: Border.all(width: 2)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: 50,
              height: 70,
              decoration: BoxDecoration(
                  color: (widget.tasktype == 'Daily')
                      ? Colors.green[400]
                      : (widget.tasktype == 'Weekly')
                          ? Colors.blue[400]
                          : (widget.tasktype == 'Hobby')
                              ? Colors.purple[400]
                              : (widget.tasktype == 'Habbit')
                                  ? Colors.orange[400]
                                  : Colors.indigoAccent,
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(width: 2)),
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
                  MaterialPageRoute(builder: (context) => MyCustomForm()),
                );
              },
              child: Container(
                  width: MediaQuery.of(context).size.width * 0.831,
                  height: 70,
                  decoration: BoxDecoration(
                      color: (widget.taskdifficulty == 'Easy')
                          ? Colors.red[200]
                          : (widget.taskdifficulty == 'Medium')
                              ? Colors.orange
                              : (widget.taskdifficulty == 'Hard')
                                  ? Colors.blue[500]
                                  : (widget.taskdifficulty == 'Very Hard')
                                      ? Colors.indigo[300]
                                      : Colors.indigoAccent,
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(width: 2)),
                  child: ListTile(
                    leading: Text(
                      widget.taskname,
                      style:
                          TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
                      overflow: TextOverflow.ellipsis,
                    ),
                    subtitle: Text(
                      widget.tasknotes,
                      style:
                          TextStyle(fontWeight: FontWeight.w900, fontSize: 15),
                      overflow: TextOverflow.ellipsis,
                    ),
                    trailing: IconButton(
                      icon: Icon(
                        Icons.close_rounded,
                        size: 50,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        setState(() {
                          widget.visible = false;
                        });
                      },
                    ),
                  )),
            )
          ],
        ),
      );
    } else {
      return Container();
    }
  }
}
