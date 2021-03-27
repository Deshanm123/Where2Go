import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
 import 'package:login_where2go/src/services/auth_service.dart';
 import 'package:firebase_auth/firebase_auth.dart';

//get data from user data and show it off

class Where2GoList extends StatefulWidget {
final data;
User currentListuser;
  Where2GoList({this.data,this.currentListuser});
  @override
  _Where2GoListState createState() => _Where2GoListState();
}
class _Where2GoListState extends State<Where2GoList> {
 
  @override
  Widget build(BuildContext listcontext) {
  //   final firebaseAuth =Provider.of<FirebaseAuth>(context);
  // final String userid= (firebaseAuth.currentUser).uid;
          // child:Text(widget.currentListuser.uid),
     return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
        icon: Icon(Icons.arrow_back),
        tooltip: " Return to MapScreen",
         onPressed: () {Navigator.pop(context);}
        ),
          title: Text('Where2goList'),
        ),
        body: StreamBuilder(
          stream:FirebaseFirestore.instance.collection('userDataCollection')
                                  .doc(widget.currentListuser.uid)
                                  .collection('userWishListDataCollection').snapshots(),
          builder:(context,snapshot){
            return ListView.builder(
                itemCount:snapshot.data.docs.length,
                itemBuilder:(context,index){
                  DocumentSnapshot listedLocation = snapshot.data.docs[index];
                  return ListTile(
                    title:Text('${listedLocation['toGoListedLocation']}'),
                  );
                }
            );
          },
          ),
        
      ),
    );
  }
}