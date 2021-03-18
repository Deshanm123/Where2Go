import 'package:flutter/material.dart';

class Where2GoList extends StatefulWidget {

  var data;

  Where2GoList({this.data});

  @override
  _Where2GoListState createState() => _Where2GoListState();

}
class _Where2GoListState extends State<Where2GoList> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Where2goList'),
        ),
        body:Container(
        child:Text(widget.data["loc_Name"]),
        ),
        //  ListView.builder(
          // itemCount: items.length,
          // itemBuilder: (context, index) {
          //   return ListTile(
          //     title: Text('${items[index]}'),
          //   );
          // },
        // ),
      ),
    );
  }
}