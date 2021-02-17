// Define a custom Form widget.
import 'package:flutter/material.dart';

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
  int group_value;
  int group_value2;
  String T_name;
  String T_notes;

  final _formKey = GlobalKey<FormState>();
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return MaterialApp(
      title: 'Welcome	to	Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Add Task'),
        ),
        body: Center(
          child: Form(
              key: _formKey,
              child: ListView(padding: EdgeInsets.all(20.0), children: <Widget>[
                // Add TextFormFields and ElevatedButton here.
                SizedBox(
                  height: 8.0,
                ),

                Container(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: TextFormField(
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
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                          Text("Very Hard"),
                          new Radio(
                            onChanged: (int e) => _radButtonsDiff(e),
                            groupValue: group_value,
                            value: 4,
                            activeColor: Colors.orange,
                          ),
                        ]),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("(5 exp)"),
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
                          Text("Habbit"),
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
                  onPressed: () {
                    // Validate returns true if the form is valid, otherwise false.

                    // If the form is valid, display a snackbar. In the real world,
                    // you'd often call a server or save the information in a database.

                    {
                      Navigator.pop(context);
                    }
                  },
                  child: Text('Submit'),
                ),
              ])),
        ), //	Center
      ), //	Scaffold
    );
  }

  void _radButtonsDiff(int e) {
    setState(() {
      if (e == 1) {
        group_value = 1;
      } else if (e == 2) {
        group_value = 2;
      } else if (e == 3) {
        group_value = 3;
      } else if (e == 4) {
        group_value = 4;
      }
    });
  }

  void _radButtonsType(int e) {
    setState(() {
      if (e == 1) {
        group_value2 = 1;
      } else if (e == 2) {
        group_value2 = 2;
      } else if (e == 3) {
        group_value2 = 3;
      } else if (e == 4) {
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
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
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
