import 'package:flutter/material.dart';
import 'forgot_password.dart';
import 'signup.dart';
import 'welcomePage.dart';
import 'package:facebook_sdk/facebook_sdk.dart';
// import 'com.facebook.appevents.AppEventsLogger';
// import 'package:facebook_sdk';
import 'package:google_fonts/google_fonts.dart';
import 'Widget/bezierContainer.dart';
import 'modules/task_page.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class LoginPage extends StatefulWidget {

  // @override
  // void onCreate() {
  //   super.onCreate();
  //   FacebookSdk.sdkInitialize(getApplicationContext());
  //   AppEventsLogger.activateApp(this);
  // }

  @override
  _LoginPageState createState() => _LoginPageState();

}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var _scaffoldKey = new GlobalKey<ScaffoldState>();

  String _email;
  String _password;

  void fbLogin() async {
    // await FacebookSdk.logOut();
    FacebookLoginResult result = await FacebookSdk.logInWithReadPermissions(['email']);
    print(result);
    print(result.status);
    print(result.accessToken);
    print(result.accessToken.token);
    print(result.errorMessage);
  }

  void validateAndSave() {
    final FormState form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      print('Data is valid');
      Navigator.push(context, MaterialPageRoute(builder: (context) => Tasks()));
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
                    return ('Email Format must have @ and .com (ex:---@---.com)');
                  }
                  return null;
                },
                onSaved: (value) => _email = value,
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
            'Login',
            style: TextStyle(fontSize: 30.0),
          ),
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(vertical: 15),
          alignment: Alignment.center,
        ));
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

  Widget _createAccountLabel() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => SignUpPage()));
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 1),
        padding: EdgeInsets.all(15),
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Don\'t have an account ?',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'Register',
              style: TextStyle(
                  color: Colors.orange[600],
                  fontSize: 23,
                  fontWeight: FontWeight.w900),
            ),
          ],
        ),
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
              top: -height * .15,
              right: -MediaQuery.of(context).size.width * .4,
              child: BezierContainer()),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: height * .2),
                  _title(),
                  SizedBox(height: 50),
                  _emailPasswordWidget(),
                  SizedBox(height: 20),
                  _submitButton(),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    alignment: Alignment.centerRight,
                    child: TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ForgotPassword()));
                        },
                        child: Text('Forgot Password ?',
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.red[500],
                                fontWeight: FontWeight.w500))),
                  ),
                  _divider(),
                  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Divider(),
                        SignInButton(
                          Buttons.GoogleDark,
                          onPressed: () {},
                        ),
                        Divider(),
                        SignInButton(
                          Buttons.FacebookNew,
                          onPressed: fbLogin,
                        ),
                        Divider(),
                        SignInButton(
                          Buttons.Twitter,
                          text: "Use Twitter",
                          onPressed: () {},
                        ),
                      ]),
                  SizedBox(height: height * .055),
                  _createAccountLabel(),
                ],
              ),
            ),
          ),
          Positioned(top: 40, left: 0, child: _backButton()),
        ],
      ),
    ));
  }
}
