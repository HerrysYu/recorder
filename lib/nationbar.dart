import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:recorder/chatPage.dart';
import 'package:recorder/main.dart';
import 'package:recorder/mainpage.dart';
import 'package:recorder/sum.dart';
class nationBar extends StatefulWidget{
  String country;
  String name;
  String content;
  nationBar({
    required this.country,
    required this.name,
    required this.content
  });
  @override
  State<StatefulWidget> createState() => nationBarState();
}
class nationBarState extends State<nationBar>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onDoubleTap: () {
        helper.deletemember(widget.name);
        memberupdate();
        mainpagestream.add('');
      },
      onLongPress: (){
        Navigator.push(context,   MaterialPageRoute(
                                              builder: (context) => MyHomePage(content: widget.content,country: widget.country,name: widget.name,)));
      },
      onHorizontalDragStart: (details) {
        Navigator.push(context,MaterialPageRoute(builder: (context)=>chatPage()));
      },
      child: Container(
        clipBehavior: Clip.hardEdge,
        child: SizedBox(
          width: 300,
          height: 100,
          child: Center(
           child:  Row(
             children: [
              Padding(
                padding: const EdgeInsets.only(left: 20.0,right: 0,top: 10,bottom: 10),
                child: SizedBox(
                  height: 100,
                  width: 100,
                  child: Image.asset('assets/unlogo.png')),
              ),
               Column(children: [
                SizedBox(
                  height: 100,
                  width: 180,
                  child: Column(children: [
                    Padding(padding: EdgeInsets.only(left: 0,right: 8,bottom: 2,top: 20),child: Text(widget.country+'代表团'),),
                    Padding(padding: EdgeInsets.only(left: 0,top: 0,right: 8,bottom: 8),child: Text(widget.name,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),)
                  ],))
                ],),
             ],
           )
          ),
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [ BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 22,
                        offset: Offset(-1, 1),
                      )]
        ),
      ),
    );
    throw UnimplementedError();
  }

}