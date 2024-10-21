//import 'package:bubble/bubble.dart';
//import 'package:chat_bubbles/message_bars/message_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:hexcolor/hexcolor.dart';
//mport 'package:vtfriend/chatPage.dart';

class messagebubble extends StatelessWidget {
  final bool isme;
  final String message;
  messagebubble({required this.isme, required this.message});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    if (isme == true) {
      return Padding(
        padding: const EdgeInsets.only(right: 20, top: 12, bottom: 12),
        child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
          SizedBox(
            child: Container(
              child: Center(
                  child: Padding(
                padding: const EdgeInsets.only(
                    top: 10, bottom: 10, left: 15, right: 15),
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 300),
                  child: Text(
                    message,
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ),
              )),
              decoration: BoxDecoration(
                  color: HexColor("#b8c1ec"),
                  border: Border.all(color: HexColor("#b8c1ec")),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 22,
                      offset: Offset(-1, 1),
                    )
                  ],
                  borderRadius: BorderRadius.all(Radius.circular(20))),
            ),
          ),
          SizedBox(
            height: 50,
            width: 0,
          )
        ]),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.only(left: 20, top: 12, bottom: 12),
        child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          SizedBox(
            height: 50,
            width: 0,
          ),
          SizedBox(
            child: Container(
              child: Center(
                  child: Padding(
                padding: const EdgeInsets.only(
                    top: 10, bottom: 10, left: 15, right: 15),
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 300),
                  child: Text(
                    softWrap: true,
                    message,
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: HexColor("#232946")),
                  ),
                ),
              )),
              decoration: BoxDecoration(
                  color: HexColor("#eebbc3"),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 22,
                      offset: Offset(-1, 1),
                    )
                  ],
                  border: Border.all(color: HexColor("#eebbc3")),
                  borderRadius: BorderRadius.all(Radius.circular(20))),
            ),
          ),
        ]),
      );
    }
    throw UnimplementedError();
  }
}
