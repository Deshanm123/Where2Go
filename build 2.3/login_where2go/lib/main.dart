import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:login_where2go/src/screens/mapScreen/mapscreen.dart';
 import 'package:login_where2go/src/screens/login.dart';
 import 'package:login_where2go/src/services/auth_service.dart';

void main() async{
   WidgetsFlutterBinding.ensureInitialized();
   //need this later uncomment
   await Firebase.initializeApp();
  runApp(App());
}
class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title:'LoginApp',
        theme:ThemeData(
          accentColor:Colors.orange,
          primarySwatch: Colors.blue 
          ),
          home:
          //  GoogleMapsScreen(),
            LoginScreen(),
          //  SignUpScreen(),
          routes:<String,WidgetBuilder>{
            //'/home':(BuildContext context)=>HomeScreen(),
          }
    );
  }
}
