import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import'src/app.dart';

void main() async{
   WidgetsFlutterBinding.ensureInitialized();
   //need this later uncomment
   await Firebase.initializeApp();
  runApp(App());
}
