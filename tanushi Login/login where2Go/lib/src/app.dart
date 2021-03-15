import 'package:flutter/material.dart';
// import 'package:login_where2go/src/screens/home.dart';
import 'package:login_where2go/src/screens/login.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'LoginApp',
      theme: ThemeData(accentColor: Colors.blue, primarySwatch: Colors.blue),
      home: LoginScreen(),
    );
  }
}
