import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'stock_types.dart';

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