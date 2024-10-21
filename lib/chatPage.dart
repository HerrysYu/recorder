import 'dart:async';
import 'dart:io';

//import 'package:bubble/bubble.dart';
//import 'package:chat_bubbles/message_bars/message_bar.dart';
import 'package:flutter/material.dart';
//import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:recorder/messagebubble.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/utils/utils.dart';
//import 'package:vtfriend/MainPage.dart';
//import 'package:vtfriend/main.dart';
//import 'package:recoder
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:recorder/messagesendbar.dart';
//import 'package:vtfriend/editingPage.dart';

StreamController ChatPageStream = new StreamController.broadcast();
List<chatmessageInfo> messageList = [];
SocketConnectChat socketConnectChat = new SocketConnectChat();
ScrollController scrollController = new ScrollController();
String title = "KeJour";

class chatPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => chatPageState();
}
String currentperf="";
 getperf()async{
  final perf=await SharedPreferences.getInstance();
  currentperf=perf.getString('general')??"";
}
class chatPageState extends State<chatPage> {
  @override
  void initState() {
    getperf();
    // TODO: implement initState
    socketConnectChat.Connect();
    title = "Loading";
    ChatPageStream.add("");
    socketConnectChat.webSocketChannel.sink.add(
        "你现在是一个模拟联合国活动会议记录员，以下是会议信息，内容前的数字为时间，第一个数字为小时，第二个数字为分钟，第三个数字为秒,请回答我几个问题,谢谢，以下是相关信息"+currentperf+"请说‘请向我提问，我会帮你总结会议相关内容’");
    super.initState();
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
  }

  @override
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return StreamBuilder(
        stream: ChatPageStream.stream,
        builder: (context, snapshot) {
          return Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                titleTextStyle: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
                backgroundColor: Colors.transparent,
                leading: IconButton(
                  icon: Icon(
                    Icons.close,
                    color: Colors.white,
                  ),
                  onPressed: () async {
                    //
                  },
                ),
                title: Text(title),
              ),
              body: GestureDetector(
                  onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
                  child: Stack(
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.only(bottom: 100, left: 0, right: 0),
                        child: ListView(
                            controller: scrollController,
                            reverse: true,
                            children: [
                              for (var obj in messageList.reversed)
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: GestureDetector(
                                      onLongPress: () {
                                       
                                      },
                                      child: chatmessage(
                                          isai: obj.isai,
                                          content: obj.content)),
                                )
                            ]),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Center(
                              child: Padding(
                            padding: EdgeInsets.only(bottom: 30),
                            child: messagebar(
                              onsend: (message) {
                                messageList.add(
                                    chatmessageInfo(isai: 0, content: message));
                                title = "Loading";
                                ChatPageStream.add("");
                                socketConnectChat.webSocketChannel.sink
                                    .add(message);
                              },
                            ),
                          ))
                        ],
                      )
                    ],
                  )));
        });
    throw UnimplementedError();
  }
}


class chatmessage extends StatelessWidget {
  int isai;
  String content;
  chatmessage({required this.isai, required this.content});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build]
    if (isai == 0) {
      return messagebubble(isme: true, message: content);
    } else {
      return messagebubble(isme: false, message: content);
    }
    throw UnimplementedError();
  }
}

class chatmessageInfo {
  int isai;
  String content;
  chatmessageInfo({required this.isai, required this.content});
}

class SocketConnectChat {
  late WebSocketChannel webSocketChannel;
  Connect() {
    webSocketChannel =
        WebSocketChannel.connect(Uri.parse("ws://202.182.127.220:1211"));
    this.webSocketChannel.stream.listen((dynamic message) {
      if (message == "received") {
        title = "loading";
        ChatPageStream.add("");
      } else {
        title = "KeJour";
        messageList.add(chatmessageInfo(isai: 1, content: message.toString()));
        ChatPageStream.add("");
      }
    });
  }
}
