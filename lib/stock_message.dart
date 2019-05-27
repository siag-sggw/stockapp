import 'package:flutter/material.dart';

class MesssageWidget extends StatefulWidget {
  @override
  MessageState createState() => MessageState();
}

class MessageState extends State<MesssageWidget> {
    @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("Session ended")),
      body: new Container(
          padding: const EdgeInsets.all(20.0),
          child: new Center(
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                    new Text(
                        "You were loged out",
                      ),
              ],
            ),
          )),
    );
  }
}