import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:login_where2go/src/screens/reset.dart';
import 'package:login_where2go/src/screens/verify.dart';
import 'home.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String _email;
  String _password;

  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        // Padding(
        //   padding: EdgeInsets.only(bottom: 20),
        //   child: Image(
        //     image: AssetImage('assets/done.png'),
        //   ),
        // ),
        Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.email,
                color: Color(0xff2470c7),
              ),
              hintText: 'Enter email address Here',
            ),
            onChanged: (value) {
              setState(() {
                _email = value.trim();
              });
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: TextField(
            obscureText: true,
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.lock,
                color: Color(0xff2470c7),
              ),
              hintText: 'Enter password Here',
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
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 70.0),
            splashColor: Color(0xff2470c7),
            child: Text(
              'Sign in',
              style: TextStyle(
                color: Colors.white,
                letterSpacing: 1.5,
                fontSize: MediaQuery.of(context).size.height / 40,
              ),
            ),
            onPressed: () {
              auth
                  .signInWithEmailAndPassword(
                      email: _email, password: _password)
                  .then((_) {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => HomeScreen() //future
                    ));
              });
            },
          ),
          RaisedButton(
            color: Theme.of(context).accentColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 70.0),
            splashColor: Color(0xff2470c7),
            child: Text(
              'Signup',
              style: TextStyle(
                color: Colors.white,
                letterSpacing: 1.5,
                fontSize: MediaQuery.of(context).size.height / 40,
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
                  'Forget Password?',
                  style: TextStyle(
                    fontSize: 21.0,
                  ),
                ),
                onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ResetScreen(),
                    ))),
          ],
        ),
      ],
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

// @override
// Widget build(BuildContext context) {
//   return SafeArea(
//     child: Scaffold(
//       resizeToAvoidBottomInset: false,
//       // resizeToAvoidBottomPadding: false,
//       backgroundColor: Color(0xff2470c7),
//       body: Stack(
//         children: <Widget>[
//           Container(
//             height: MediaQuery.of(context).size.height * 1,
//             width: MediaQuery.of(context).size.width,
//           ),
//           Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
// _buildContainer(),

// _buildSignUpBtn(),
//             ],
//           )
//         ],
//       ),
//     ),
//   );
// }

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
