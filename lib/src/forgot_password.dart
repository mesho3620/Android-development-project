import 'package:flutter/material.dart';
import 'package:flutter_login_signup/src/Widget/bezierContainer.dart';
import 'package:flutter_login_signup/src/loginPage.dart';
import 'package:flutter_login_signup/src/welcomePage.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _new_password;
  String _repeated_new_password;

  void validateAndSave() {
    final FormState form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      print('Data Saved');
    } else {
      print('Data is invalid');
    }
  }

  Widget _entryField() {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'New Password',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                decoration: InputDecoration(
                    hintText: 'New Password',
                    border: InputBorder.none,
                    fillColor: Color(0xfff3f3f4),
                    filled: true),
                validator: (value) {
                  if (value.isEmpty) {
                    return ('Password cannot be blank');
                  }
                  if (value.length < 4) {
                    return ('Password must be more than 4 characters');
                  }
                  if (value.contains(new RegExp(r'[A-Z]')) == false) {
                    return ('Password must contain at least 1 upper case');
                  }
                  if (value.contains(new RegExp(r'[0-9]')) == false) {
                    return ('Password must contain at least 1 digit');
                  }
                  if (value.contains(new RegExp(r'[a-z]')) == false) {
                    return ('Password must contain at least 1 lower case');
                  }
                  if (value.contains(new RegExp(r'[!@#$%^&*(),.?":{}|<>]')) ==
                      false) {
                    return ('Password must contain at least 1 special case');
                  }
                  return null;
                },
                onChanged: (value) => _new_password = value,
              ),
              Text(
                'Repeat New Password',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'New Password',
                  border: InputBorder.none,
                  fillColor: Color(0xfff3f3f4),
                  filled: true,
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return ('Password cannot be blank');
                  }
                  if (value.length < 4) {
                    return ('Password must be more than 4 characters');
                  }
                  if (value.contains(new RegExp(r'[A-Z]')) == false) {
                    return ('Password must contain at least 1 upper case');
                  }
                  if (value.contains(new RegExp(r'[0-9]')) == false) {
                    return ('Password must contain at least 1 digit');
                  }
                  if (value.contains(new RegExp(r'[a-z]')) == false) {
                    return ('Password must contain at least 1 lower case');
                  }
                  if (value.contains(new RegExp(r'[!@#$%^&*(),.?":{}|<>]')) ==
                      false) {
                    return ('Password must contain at least 1 special case');
                  }
                  if (value != _new_password) {
                    return ('passwords does not match');
                  }
                  return null;
                },
                onChanged: (value) => _repeated_new_password = value,
              )
            ],
          ),
        ));
  }

  Widget _backButton() {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 0, top: 10, bottom: 10),
              child: Icon(Icons.keyboard_arrow_left, color: Colors.black),
            ),
            Text('Back',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500))
          ],
        ),
      ),
    );
  }

  Widget _submitButton() {
    return RaisedButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        color: Colors.orange,
        highlightColor: Colors.yellow[500],
        onPressed: validateAndSave,
        child: Container(
          child: Text(
            'Change Password',
            style: TextStyle(fontSize: 30.0),
          ),
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(vertical: 15),
          alignment: Alignment.center,
        ));
  }

  Widget _title() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          text: 'T',
          style: GoogleFonts.portLligatSans(
            textStyle: Theme.of(context).textTheme.display1,
            fontSize: 40,
            fontWeight: FontWeight.w700,
            color: Colors.purple[500],
          ),
          children: [
            TextSpan(
              text: 'ask',
              style: TextStyle(color: Colors.black, fontSize: 35),
            ),
            TextSpan(
              text: ' H',
              style: TextStyle(color: Colors.purple[500], fontSize: 40),
            ),
            TextSpan(
              text: 'ero',
              style: TextStyle(color: Colors.black, fontSize: 35),
            ),
          ]),
    );
  }

  Widget _emailPasswordWidget() {
    return Column(
      children: <Widget>[_entryField()],
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        height: height,
        child: Stack(
          children: <Widget>[
            Positioned(
              top: -MediaQuery.of(context).size.height * .15,
              right: -MediaQuery.of(context).size.width * .4,
              child: BezierContainer(),
            ),
            Positioned(
              bottom: -MediaQuery.of(context).size.height * .30,
              right: -MediaQuery.of(context).size.width * .60,
              child: BezierContainer(),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: height * .2),
                    _title(),
                    SizedBox(
                      height: 50,
                    ),
                    _emailPasswordWidget(),
                    SizedBox(
                      height: 20,
                    ),
                    _submitButton(),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
            Positioned(top: 40, left: 0, child: _backButton()),
          ],
        ),
      ),
    );
  }
}
