import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_app_01/src/screens/reset.dart';
import 'package:flutter_app_01/src/screens/verify.dart';
import 'package:flutter_app_01/src/screens/welcome.dart';
// import 'home.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  String _email;
  String _password;
  String _name;
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(0),
            child: Image(
              image: AssetImage('assets/done.png'),
              height: 400,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 0),
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.account_circle,
                  color: Color(0xff2470c7),
                ),
                hintText: 'Enter Your Name address Here',
              ),
              onChanged: (value) {
                setState(() {
                  _name = value.trim();
                });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 0),
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.email,
                  color: Color(0xff2470c7),
                ),
                hintText: 'Enter Your Email address Here',
              ),
              onChanged: (value) {
                setState(() {
                  _email = value.trim();
                });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 0),
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.lock,
                  color: Color(0xff2470c7),
                ),
                hintText: 'Enter Your Password Here',
              ),
              onChanged: (value) {
                setState(() {
                  _password = value.trim();
                });
              },
            ),
          ),
          Row(children: <Widget>[
            RaisedButton(
              color: Theme.of(context).accentColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50)),
              padding: EdgeInsets.only(left: 160.0, right: 160.0),
              splashColor: Color(0xff2470c7),
              child: Text(
                'Signup',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  letterSpacing: 1.5,
                  height: 1.5,
                  fontSize: MediaQuery.of(context).size.height / 26,
                ),
              ),
              onPressed: () {
                auth
                    .createUserWithEmailAndPassword(
                        email: _email, password: _password)
                    .then((_) {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => VerifyScreen()));
                });
              },
            ),
          ]),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                  child: Text(
                    'Already have an Account? Login Here',
                    style: TextStyle(
                      fontSize: 21.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => WelcomeScreen(),
                      ))),
            ],
          ),
        ],
      ),
    ));
  }

  // Widget _buildContainer() {
  //   return Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
  //     ClipRRect(
  //       borderRadius: BorderRadius.all(
  //         Radius.circular(50),
  //       ),
  //       child: Container(
  //         height: MediaQuery.of(context).size.height * 0.8,
  //         width: MediaQuery.of(context).size.width * 0.9,
  //         decoration: BoxDecoration(
  //           color: Colors.white,
  //         ),
  //         child: Column(
  //             mainAxisAlignment: MainAxisAlignment.start,
  //             crossAxisAlignment: CrossAxisAlignment.center,
  //             children: <Widget>[
  //               Row(
  //                 mainAxisAlignment: MainAxisAlignment.center,
  //                 children: <Widget>[
  //                   Padding(
  //                     padding: EdgeInsets.only(bottom: 20),
  //                     child: TextField(
  //                       keyboardType: TextInputType.emailAddress,
  //                       decoration: InputDecoration(
  //                         prefixIcon: Icon(
  //                           Icons.email,
  //                           color: Color(0xff2470c7),
  //                         ),
  //                         hintText: 'Enter email address Here',
  //                       ),
  //                       onChanged: (value) {
  //                         setState(() {
  //                           _email = value.trim();
  //                         });
  //                       },
  //                     ),
  //                   ),
  //                   Padding(
  //                     padding: const EdgeInsets.only(bottom: 20),
  //                     child: TextField(
  //                       obscureText: true,
  //                       decoration: InputDecoration(
  //                         prefixIcon: Icon(
  //                           Icons.lock,
  //                           color: Color(0xff2470c7),
  //                         ),
  //                         hintText: 'Enter password Here',
  //                       ),
  //                       onChanged: (value) {
  //                         setState(() {
  //                           _password = value.trim();
  //                         });
  //                       },
  //                     ),
  //                   ),
  //                   Row(
  //                     children: <Widget>[
  //                       RaisedButton(
  //                         color: Theme.of(context).accentColor,
  //                         shape: RoundedRectangleBorder(
  //                             borderRadius: BorderRadius.circular(40)),
  //                         padding: EdgeInsets.symmetric(
  //                             vertical: 10.0, horizontal: 70.0),
  //                         splashColor: Color(0xff2470c7),
  //                         child: Text(
  //                           'Sign in',
  //                           style: TextStyle(
  //                             color: Colors.white,
  //                             letterSpacing: 1.5,
  //                             fontSize: MediaQuery.of(context).size.height / 40,
  //                           ),
  //                         ),
  //                         onPressed: () {
  //                           auth
  //                               .signInWithEmailAndPassword(
  //                                   email: _email, password: _password)
  //                               .then((_) {
  //                             Navigator.of(context).pushReplacement(
  //                                 MaterialPageRoute(
  //                                     builder: (context) =>
  //                                         HomeScreen() //future
  //                                     ));
  //                           });
  //                         },
  //                       ),
  //                       RaisedButton(
  //                         color: Theme.of(context).accentColor,
  //                         shape: RoundedRectangleBorder(
  //                             borderRadius: BorderRadius.circular(40)),
  //                         padding: EdgeInsets.symmetric(
  //                             vertical: 10.0, horizontal: 70.0),
  //                         splashColor: Color(0xff2470c7),
  //                         child: Text(
  //                           'Signup',
  //                           style: TextStyle(
  //                             color: Colors.white,
  //                             letterSpacing: 1.5,
  //                             fontSize: MediaQuery.of(context).size.height / 40,
  //                           ),
  //                         ),
  //                         onPressed: () {
  //                           auth
  //                               .createUserWithEmailAndPassword(
  //                                   email: _email, password: _password)
  //                               .then((_) {
  //                             Navigator.of(context).pushReplacement(
  //                                 MaterialPageRoute(
  //                                     builder: (context) => VerifyScreen()));
  //                           });
  //                         },
  //                       ),
  //                     ],
  //                   ),
  //                 ],
  //               ),
  //             ]),
  //       ),
  //     )
  //   ]);
}

@override
Widget build(BuildContext context) {
  return SafeArea(
    child: Scaffold(
      resizeToAvoidBottomInset: false,
      // resizeToAvoidBottomPadding: false,
      backgroundColor: Color(0xff2470c7),
      body: Stack(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height * 1,
            width: MediaQuery.of(context).size.width,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
// _buildContainer(),

// _buildSignUpBtn(),
            ],
          )
        ],
      ),
    ),
  );
}

// @override
// Widget build(BuildContext context) {
//   return Scaffold(
//       body: Column(
//     mainAxisAlignment: MainAxisAlignment.center,
//     children: <Widget>[
//       Padding(
//         padding: EdgeInsets.only(bottom: 20),
//         child: TextField(
//           keyboardType: TextInputType.emailAddress,
//           decoration: InputDecoration(
//             prefixIcon: Icon(
//               Icons.email,
//               color: Color(0xff2470c7),
//             ),
//             hintText: 'Enter email address Here',
//           ),
//           onChanged: (value) {
//             setState(() {
//               _email = value.trim();
//             });
//           },
//         ),
//       ),
//       Padding(
//         padding: const EdgeInsets.only(bottom: 20),
//         child: TextField(
//           obscureText: true,
//           decoration: InputDecoration(
//             prefixIcon: Icon(
//               Icons.lock,
//               color: Color(0xff2470c7),
//             ),
//             hintText: 'Enter password Here',
//           ),
//           onChanged: (value) {
//             setState(() {
//               _password = value.trim();
//             });
//           },
//         ),
//       ),
//       Row(children: <Widget>[
//         RaisedButton(
//           color: Theme.of(context).accentColor,
//           shape:
//               RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
//           padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 70.0),
//           splashColor: Color(0xff2470c7),
//           child: Text(
//             'Sign in',
//             style: TextStyle(
//               color: Colors.white,
//               letterSpacing: 1.5,
//               fontSize: MediaQuery.of(context).size.height / 40,
//             ),
//           ),
//           onPressed: () {
//             auth
//                 .signInWithEmailAndPassword(
//                     email: _email, password: _password)
//                 .then((_) {
//               Navigator.of(context).pushReplacement(MaterialPageRoute(
//                   builder: (context) => HomeScreen() //future
//                   ));
//             });
//           },
//         ),
//         RaisedButton(
//           color: Theme.of(context).accentColor,
//           shape:
//               RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
//           padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 70.0),
//           splashColor: Color(0xff2470c7),
//           child: Text(
//             'Signup',
//             style: TextStyle(
//               color: Colors.white,
//               letterSpacing: 1.5,
//               fontSize: MediaQuery.of(context).size.height / 40,
//             ),
//           ),
//           onPressed: () {
//             auth
//                 .createUserWithEmailAndPassword(
//                     email: _email, password: _password)
//                 .then((_) {
//               Navigator.of(context).pushReplacement(
//                   MaterialPageRoute(builder: (context) => VerifyScreen()));
//             });
//           },
//         ),
//       ]),
//       Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           TextButton(
//               child: Text(
//                 'Forget Password?',
//                 style: TextStyle(
//                   fontSize: 21.0,
//                 ),
//               ),
//               onPressed: () => Navigator.of(context).push(MaterialPageRoute(
//                     builder: (context) => ResetScreen(),
//                   ))),
//         ],
//       ),
//     ],
//   ));
// }
// }
