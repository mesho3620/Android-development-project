import 'package:flutter/material.dart';

class task_detail {
  String taskname;
  String tasknotes;
  String tasktype;
  String taskdifficulty;
  String dateDay;
  String dateMonth;

  task_detail(
      {@required this.taskname,
      @required this.tasknotes,
      @required this.tasktype,
      @required this.taskdifficulty,
      @required this.dateDay,
      @required this.dateMonth});
}
