import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
              child:Text('Sign In'),
              onPressed:()=>_signIn(_email,_password),
            ),
             RaisedButton(
               color:Theme.of(context).accentColor,
              child:Text('Sign Up'),
              onPressed:()=>_signUp(_email, _password),
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

_signIn(String _email,String _password) async{

    try{  
      await auth.signInWithEmailAndPassword(email: _email, password: _password);
      //sucessful login
      Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder:(context)=>HomeScreen())); 
    }on FirebaseAuthException catch (error){
      Fluttertoast.showToast(msg:error.message,gravity:ToastGravity.TOP);
    }
}
_signUp(String _email,String _password) async{
  
    try{  
      auth.createUserWithEmailAndPassword(email: _email, password: _password);
      //sucessful login 
      Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder:(context)=>VerifyScreen() ));
     
    }on FirebaseAuthException catch (error){
      Fluttertoast.showToast(msg:error.message,gravity:ToastGravity.TOP);
    }
}


}