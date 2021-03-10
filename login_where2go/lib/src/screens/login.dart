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
      appBar:AppBar(
        title:Text('Where2Go Login')
      ),
      body:Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              keyboardType:TextInputType.emailAddress,
              decoration:InputDecoration(
                hintText:'Email',
              ),
              onChanged: (value){
                setState((){
                  _email =value.trim();  
                });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              obscureText:true,
              decoration:InputDecoration(
                hintText:'Password',
              ),
              onChanged: (value){
                setState(() {
                  _password = value.trim();
                });
              },
            ),
          ), 
          Row(children:<Widget> [
            RaisedButton(
              color:Theme.of(context).accentColor,
              child:Text('Sign up'),
              onPressed:(){ 
                auth.signInWithEmailAndPassword(email: _email, password: _password).then((_){ 
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder:(context)=>HomeScreen() //future
                )); 
                });
              },
            ),
             RaisedButton(
               color:Theme.of(context).accentColor,
              child:Text('Sign in'),
              onPressed:(){
                auth.createUserWithEmailAndPassword(email: _email, password: _password).then((_){
                   Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder:(context)=>VerifyScreen() ));
                });
              },
            ),
            ]
            ),
            Row(
              mainAxisAlignment:MainAxisAlignment.center,
              children:[
              TextButton(child:Text('Forget Password?'),onPressed:()=>Navigator.of(context)
               .push(MaterialPageRoute(
                 builder:(context) => ResetScreen(),
                ))
               ),
            ],),
          ],)
        
        );
      
    
  }
}