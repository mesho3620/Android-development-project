// Define a custom Form widget.
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import './notifications/NotificationPlugin.dart';

class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// Define a corresponding State class.
// This class holds data related to the form.
class MyCustomFormState extends State<MyCustomForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a `GlobalKey<FormState>`,
  // not a GlobalKey<MyCustomFormState>.
  bool CheckBoxValue = false;
  int group_value = 1;
  int group_value2 = 1;
  String T_name;
  String T_notes;

  String taskname;
  String tasknotes;
  String tasktype = 'Dailies';
  String taskdifficulty = 'Easy';
  String date = DateTime.now().toString();

  final _formKey = GlobalKey<FormState>();

  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();

  final myController = TextEditingController();
  final myController1 = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    final FormState form = _formKey.currentState;

    CollectionReference Tasks = Firestore.instance.collection('Tasks');

    Future<void> addTask() {
      // Call the user's CollectionReference to add a new user
      return Tasks.add({
        'taskname': myController.text, // John Doe
        'tasknotes': myController1.text, // Stokes and Sons
        'tasktype': tasktype, // 42
        'taskdifficulty': taskdifficulty, // Stokes and Sons
        'date': date,
      })
          .then((value) => print("Task Added"))
          .catchError((error) => print("Failed to add task: $error"));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Add Task'),
      ),
      body: Center(
        child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            key: _formKey,
            child: ListView(padding: EdgeInsets.all(20.0), children: <Widget>[
              // Add TextFormFields and ElevatedButton here.
              SizedBox(
                height: 8.0,
              ),

              Container(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: TextFormField(
                    controller: myController,
                    validator: (T_name) {
                      if (T_name.isEmpty) {
                        return ('Task name cannot be blank');
                      }
                      return null;
                    },
                    onChanged: (T_name) {
                      print("The value entered is : $T_name");
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32.0)),
                      labelText: "Task Name",
                    ),
                  )),

              SizedBox(
                height: 8.0,
              ),

              Container(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: TextFormField(
                  controller: myController1,
                  validator: (T_notes) {
                    if (T_notes.isEmpty) {
                      return ('Task name cannot be blank');
                    }
                    return null;
                  },
                  onChanged: (T_notes) {
                    print("The value entered is : $T_notes");
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32.0)),
                    labelText: "Notes",
                  ),
                  maxLines: null,
                ),
              ),

              SizedBox(
                height: 8.0,
              ),
              Column(
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text("Easy"),
                        new Radio(
                          onChanged: (int e) => _radButtonsDiff(e),
                          groupValue: group_value,
                          value: 1,
                          activeColor: Colors.green,
                        ),
                        Text("Medium"),
                        new Radio(
                          onChanged: (int e) => _radButtonsDiff(e),
                          groupValue: group_value,
                          value: 2,
                          activeColor: Colors.blue,
                        ),
                        Text("Hard"),
                        new Radio(
                          onChanged: (int e) => _radButtonsDiff(e),
                          groupValue: group_value,
                          value: 3,
                          activeColor: Colors.purple,
                        ),
                      ]),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("(10 exp)"),
                      Text("(15 exp)"),
                      Text("(20 exp)"),
                    ],
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("Daily"),
                        new Radio(
                          onChanged: (int e) => _radButtonsType(e),
                          groupValue: group_value2,
                          value: 1,
                          activeColor: Colors.green,
                        ),
                        Text("Weekly"),
                        new Radio(
                          onChanged: (int e) => _radButtonsType(e),
                          groupValue: group_value2,
                          value: 2,
                          activeColor: Colors.blue,
                        ),
                        Text("Hobby"),
                        new Radio(
                          onChanged: (int e) => _radButtonsType(e),
                          groupValue: group_value2,
                          value: 3,
                          activeColor: Colors.purple,
                        ),
                        Text("Habit"),
                        new Radio(
                          onChanged: (int e) => _radButtonsType(e),
                          groupValue: group_value2,
                          value: 4,
                          activeColor: Colors.orange,
                        ),
                      ]),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("(5 gold)"),
                      Text("(20 gold)"),
                      Text("(50 gold)"),
                      Text("(100 gold)"),
                    ],
                  )
                ],
              ),

              SizedBox(
                height: 10.0,
              ),

              Text(
                "${selectedDate.toLocal()}".split(' ')[0],
                style: TextStyle(fontSize: 55, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20.0,
              ),
              RaisedButton(
                onPressed: () => _selectDate(context), // Refer step 3
                child: Text(
                  'Select date',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                color: Colors.greenAccent,
              ),

              SizedBox(
                height: 8.0,
              ),

              Text(
                "${selectedTime.toString()}".split(' ')[0],
                style: TextStyle(fontSize: 55, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20.0,
              ),
              RaisedButton(
                onPressed: () => _selectTime(context), // Refer step 3
                child: Text(
                  'Select Time',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                color: Colors.greenAccent,
              ),
              ElevatedButton(
                onPressed: () async {
                  // Validate returns true if the form is valid, otherwise false.

                  // If the form is valid, display a snackbar. In the real world,
                  // you'd often call a server or save the information in a database.
                  if (form.validate()) {
                    form.save();
                    await notificationPlugin.setOnNotificationClick(addTask);
                    await notificationPlugin.showNotification();

                    addTask();
                    {
                      Navigator.pop(context);
                    }
                  } else {
                    return null;
                  }
                },
                child: Text('Submit'),
              ),
            ])),
      ),
    );
  }

  void _radButtonsDiff(int e) {
    setState(() {
      if (e == 1) {
        group_value = 1;
        taskdifficulty = 'Easy';
      } else if (e == 2) {
        taskdifficulty = 'Medium';
        group_value = 2;
      } else if (e == 3) {
        taskdifficulty = 'Hard';
        group_value = 3;
      } else if (e == 4) {
        taskdifficulty = 'Very Hard';
        group_value = 4;
      }
    });
  }

  void _radButtonsType(int e) {
    setState(() {
      if (e == 1) {
        tasktype = 'Dailies';
        group_value2 = 1;
      } else if (e == 2) {
        tasktype = 'Weeklies';
        group_value2 = 2;
      } else if (e == 3) {
        tasktype = 'Hobbies';
        group_value2 = 3;
      } else if (e == 4) {
        tasktype = 'Habits';
        group_value2 = 4;
      }
    });
  }

  _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate, // Refer step 1
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
      builder: (context, child) {
        return Theme(
          data: ThemeData.dark(), // This will change to light theme.
          child: child,
        );
      },
      selectableDayPredicate: _decideWhichDayToEnable,
    );
    if (picked != null)
      setState(() {
        selectedDate = picked;
        date = selectedDate.toString();
      });
    if (picked == null) {
      setState(() {
        selectedDate = DateTime.now();
        date = selectedDate.toString();
      });
    }
  }

  /// This decides which day will be enabled
  /// This will be called every time while displaying day in calender.
  bool _decideWhichDayToEnable(DateTime day) {
    if ((day.isAfter(DateTime.now().subtract(Duration(days: 1))) &&
        day.isBefore(DateTime.now().add(Duration(days: 30))))) {
      return true;
    }
    return false;
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay picked_s = await showTimePicker(
        context: context,
        initialTime: selectedTime,
        builder: (BuildContext context, Widget child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
            child: child,
          );
        });

    if (picked_s != null && picked_s != selectedTime)
      setState(() {
        selectedTime = picked_s;
      });
  }
}
