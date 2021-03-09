import 'package:flutter/material.dart';

class task_detail {
  String taskname;
  String tasknotes;
  String tasktype;
  String taskdifficulty;
  String date;

  task_detail(
      {@required this.taskname,
      @required this.tasknotes,
      @required this.tasktype,
      @required this.taskdifficulty,
      @required this.date});

  task_detail.fromMap(Map<String, dynamic> map)
      : assert(map['taskname'] != null),
        assert(map['tasknotes'] != null),
        assert(map['tasktype'] != null),
        assert(map['taskdifficulty'] != null),
        assert(map['date'] != null),

//Timestamp time;
// DateTime.fromMicrosecondsSinceEpoch(time.microsecondsSinceEpoch)
//      time=DateTime.fromMillisecondsSinceEpoch(map['time'] * 1000);

        taskname = map['taskname'],
        tasknotes = map['tasknotes'],
        tasktype=map['tasktype'],
        taskdifficulty = map['taskdifficulty'],
        date=map['date'];
  @override
  String toString() => "Record<$taskname:$tasknotes:$tasktype:$taskdifficulty:$date>";

}
