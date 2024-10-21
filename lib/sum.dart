import 'package:flutter/material.dart';
import 'package:recorder/data.dart';
import 'package:recorder/mainpage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';
class summary extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future: getcontent(),
          builder: (context,snapshot){
            return Text(summarycontent);
          },
        )
      ),
    );
  }
}
getcontent()async{
    final prefs = await SharedPreferences.getInstance();
    final contentcontent=prefs.getString('general')??"";
    summarycontent=contentcontent;
}
String summarycontent="";