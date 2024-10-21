import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:recorder/data.dart';
import 'package:recorder/main.dart';
import 'package:recorder/mainpage.dart';
import 'package:recorder/nationbar.dart';
class addpage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => addpagestate();

}
TextEditingController ctController=new TextEditingController();
TextEditingController nmController=new TextEditingController();
class addpagestate extends State<addpage>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('欢迎加入系统',style: TextStyle(fontSize: 50,fontWeight: FontWeight.bold),),
            SizedBox(
              width: 350,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: ctController,
                      decoration: InputDecoration(border: InputBorder.none),
                    ),
                  )),
              ),
            ),
            SizedBox(
              width: 350,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: nmController,
                      decoration: InputDecoration(border: InputBorder.none),
                    ),
                  )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(onPressed: ()async{
                helper.Insert(member(country: ctController.text,name: nmController.text,content: ""));
                await memberupdate();
                mainpagestream.add("");
                Navigator.pop(context);
              }, child: Icon(Icons.add)),
            )
          ],
        ),
      ),
    );
    throw UnimplementedError();
  }

}