import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:login_where2go/src/screens/login.dart';
 import 'package:login_where2go/src/screens/login.dart';

class HomeScreen extends StatelessWidget {
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title:Text('Where2Go Dashboard')
      ),
       body:Center(
        child:FlatButton(
          child:Text('Log Out'),
          onPressed:(){
            auth.signOut();
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder:(context)=>
                  // LoginScreen()
                  ));
          }
      ),
      )
    );
  }
}