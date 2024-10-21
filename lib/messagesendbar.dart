import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:hexcolor/hexcolor.dart';

class messagebar extends StatefulWidget {
  final void Function(String) onsend;
  TextEditingController MessageBarController = new TextEditingController();
  messagebar({required this.onsend});
  @override
  State<StatefulWidget> createState() => messagebarState();
}

class messagebarState extends State<messagebar> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SizedBox(
      width: 300,
      height: 70,
      child: Container(
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 30, right: 20),
              child: SizedBox(
                width: 200,
                child: TextField(
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  decoration: InputDecoration(
                      hintText: "Say Someting",
                      border: InputBorder.none,
                      hintStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: HexColor("#232946"))),
                  controller: widget.MessageBarController,
                ),
              ),
            ),
            IconButton(
                onPressed: () =>
                    widget.onsend(widget.MessageBarController.text),
                icon: Icon(Icons.send))
          ],
        ),
        decoration: BoxDecoration(
          color: HexColor("#b8c1ec"),
          borderRadius: BorderRadius.all(Radius.circular(50)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 50,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
      ),
    );
    throw UnimplementedError();
  }
}
