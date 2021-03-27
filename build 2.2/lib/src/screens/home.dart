import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:login_where2go/src/screens/login.dart';
 import 'package:login_where2go/src/screens/login.dart';
import 'package:login_where2go/src/screens/mapScreen/mapscreen.dart';
import 'package:login_where2go/src/screens/where2goList/where2goList.dart';
 import 'package:login_where2go/src/services/auth_service.dart';


class HomeScreen extends StatelessWidget {
  final auth = FirebaseAuth.instance;
  final User user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title:Text('Where2Go Dashboard')
      ),
       body:Container(
         child:Column(
        children: <Widget>[
        FlatButton(
            child:Text('Log Out'),
            onPressed:(){
              auth.signOut();
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder:(context)=>
                    LoginScreen()));
            }
        ),
        FlatButton(
            child:Text('getUID'),
            onPressed:(){
                 print('------ check uid in home screen---------');
                 //var uid = AuthService().onAuthStateChanged;
              //final result = await getCurrentUID();
             if(user==null){print('user is null');}
             else print(user.uid);
            }             
        ),
            FlatButton(
            child:Text('Explore Sri Lanka'),
            onPressed:(){
              auth.signOut();
              Navigator.of(context).push(MaterialPageRoute(builder:(context)=>
                    GoogleMapsScreen(userinMap:user)));
            }
            ),
            FlatButton(
            child:Text('Where2GoList'),
            onPressed:(){
              auth.signOut();
              Navigator.of(context).push(MaterialPageRoute(builder:(context)=>
                    Where2GoList(currentListuser:user) ));
            }
            ),
      ],
      )
       )
    );
  }
//not working error
//  Future <String> getCurrentUID() async {
//      final User user= FirebaseAuth.instance.currentUser;
//      if(user==null){print('user is null');}
//     return user.uid;
//   }
}