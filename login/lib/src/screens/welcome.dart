import 'package:flutter/material.dart';
import 'package:flutter_app_01/src/screens/login.dart';
import 'package:flutter_app_01/src/screens/signup.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(0),
              child: Image(
                image: AssetImage('assets/done.png'),
                height: 450,
                width: 500,
              ),
            ),
            Row(children: <Widget>[
              RaisedButton(
                color: Theme.of(context).accentColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
                padding: EdgeInsets.only(left: 150.0, right: 150.0),
                splashColor: Color(0xff2470c7),
                child: Text(
                  'Sign in',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    // letterSpacing: 1.5,
                    fontSize: MediaQuery.of(context).size.height / 19,
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                },
              ),
            ]),
            SizedBox(height: 25),
            RaisedButton(
              color: Theme.of(context).accentColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50)),
              padding: EdgeInsets.only(left: 135.0, right: 135.0),
              splashColor: Color(0xff2470c7),
              child: Text(
                'Signup',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  letterSpacing: 1.4,
                  fontSize: MediaQuery.of(context).size.height / 20,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => SignupScreen()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
