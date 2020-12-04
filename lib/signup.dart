import 'package:flutter/material.dart';
import 'package:flutter_login_signup/src/Widget/bezierContainer.dart';
import 'package:flutter_login_signup/src/loginPage.dart';
import 'package:flutter_login_signup/src/welcomePage.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _email;
  String _username;
  String _password;

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
                'Email',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                decoration: InputDecoration(
                    hintText: 'Email',
                    border: InputBorder.none,
                    fillColor: Color(0xfff3f3f4),
                    filled: true),
                validator: (value) {
                  if (value.isEmpty) {
                    return ('Email cannot be blank');
                  }
                  if (value.contains('@') == false ||
                      value.contains('.com') == false) {
                    return ('Email Format must have @ and .com');
                  }
                  return null;
                },
                onSaved: (value) => _email = value,
              ),
              Text(
                'Username',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                decoration: InputDecoration(
                    hintText: 'Username',
                    border: InputBorder.none,
                    fillColor: Color(0xfff3f3f4),
                    filled: true),
                validator: (value) {
                  if (value.isEmpty) {
                    return ('Username cannot be blank');
                  }
                  if (value.length < 4) {
                    return ('Username must be more than 4 characters');
                  }
                  return null;
                },
                onSaved: (value) => _username = value,
              ),
              Text(
                'Password',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Password',
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
                  return null;
                },
                onSaved: (value) => _password = value,
              )
            ],
          ),
        ));
  }

  Widget _backButton() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => WelcomePage()));
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
            'Register',
            style: TextStyle(fontSize: 30.0),
          ),
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(vertical: 15),
          alignment: Alignment.center,
        ));
  }

  Widget _loginAccountLabel() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginPage()));
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 1),
        padding: EdgeInsets.all(5),
        alignment: Alignment.topCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Already have an account ?',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'Login',
              style: TextStyle(
                  color: Color(0xfff79c4f),
                  fontSize: 23,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }

  Widget _divider() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                thickness: 3,
              ),
            ),
          ),
          Text('or', style: TextStyle(fontSize: 20)),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                thickness: 3,
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
    );
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
                    _divider(),
                    _loginAccountLabel(),
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
