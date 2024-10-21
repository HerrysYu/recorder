import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:recorder/addPage.dart';
import 'package:recorder/data.dart';
import 'package:recorder/main.dart';
import 'package:recorder/nationbar.dart';
import 'package:shared_preferences/shared_preferences.dart';
class mainpage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => mainpageState();

}
StreamController mainpagestream =new StreamController.broadcast();
sqlhelper helper=new sqlhelper();
memberupdate() async {  
 mL = await helper.members();
 // Load and obtain the shared preferences for this app.
final prefs = await SharedPreferences.getInstance();

// Save the counter value to persistent storage under the 'counter' key.
if(prefs.getString('general')==null){
  await prefs.setString('general', "");
}
}
class mainpageState extends State<mainpage>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'title',
      home: FutureBuilder(
        future: memberupdate() ,
        builder: (context, snapshot)=> StreamBuilder(
          stream: mainpagestream.stream,
          builder: (context, snapshot) {
            return Scaffold(
            floatingActionButton: FloatingActionButton(onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => addpage()));
            },child: Icon(Icons.add),),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                 for(var item in mL)
                 Padding(
                   padding: const EdgeInsets.all(20.0),
                   child: nationBar(country: item.country, name: item.name,content:item.content),
                 )
              ],),
            ),
          );
          },
        ),
      ),
    );
    throw UnimplementedError();
  }
}
String getTime(){
  DateTime now = DateTime.now();
  return now.hour.toString()+"/"+now.minute.toString()+"/"+now.second.toString();
}