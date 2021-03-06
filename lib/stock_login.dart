import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Login extends StatefulWidget {
  @override
  LoginState createState() => LoginState();
}

class LoginState extends State<Login> {
    @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
          padding: const EdgeInsets.all(20.0),
          child: new Center(
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Hero(
                  tag: 'hero',
                  child: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    radius: 128.0,
                    child: Image.asset('assets/increase.png'),
                  ),
                ),
                new ButtonTheme(
                  minWidth: 250.0,
                  height: 50.0,
                  child: new RaisedButton(
                    onPressed: this._signin,
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0),
                    ),
                    child: Text('Log In', style: TextStyle(color: Colors.white, fontSize: 20.0)),
                    color: Colors.lightBlueAccent,
                  )
                )
                //new RaisedButton(onPressed: this.onLogout, child: new Text("Logout"), color: Colors.amberAccent),
              ],
            ),
          )),
    );
  }

  Future<FirebaseUser> _signin() async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    try {
      var googleSignIn = new GoogleSignIn();
      GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
      GoogleSignInAuthentication gauth =
          await googleSignInAccount.authentication;
      final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: gauth.accessToken,
      idToken: gauth.idToken,
    );
      FirebaseUser user = await _auth.signInWithCredential(credential);
      Navigator.pushNamed(context, '/home');

      return user;
    } catch (e) {
      print(e.toString());
    }
    return null;
  }

}