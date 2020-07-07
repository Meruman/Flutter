import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:proyecto_largo/screens/video/video_final.dart';

import '../../main.dart';

class Home extends StatefulWidget {
  Home({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _Home createState() => _Home();
}

class _Home extends State<Home> {
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  bool isLoading = false;

  Future<Null> handleSignOut() async {
    this.setState(() {
      isLoading = true;
    });
    await FirebaseAuth.instance.signOut();
    await _googleSignIn.disconnect();
    await _googleSignIn.signOut();

    this.setState(() {
      isLoading = false;
    });
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => MyApp()),
        (Route<dynamic> route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        leading: FlareActor("assets/proyecto_largo.flr",
            animation: "animated icon",
            fit: BoxFit.scaleDown,
            alignment: Alignment.center),
      ),
      body: new Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new Column(
            children: <Widget>[
              SizedBox(
                height: 70.0,
              ),
              SizedBox(
                height: 0.0,
                child: new Text(
                  "Home Page",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 28.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              new RaisedButton(
                elevation: 10.0,
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(20.0)),
                padding: EdgeInsets.only(
                    top: 7.0, bottom: 7.0, right: 90.0, left: 7.0),
                onPressed: () {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) => VideoPlay()),
                      (Route<dynamic> route) => false);
                },
                child: new Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    new Image.asset(
                      'images/play.png',
                      height: 40.0,
                      width: 40.0,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: new Text(
                        "  Join a game  ",
                        style: TextStyle(
                            fontSize: 15.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                textColor: Color(0xFF292929),
                color: Colors.green,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 0.0, right: 0.0, top: 30.0, bottom: 0.0),
                child: new RaisedButton(
                  elevation: 10.0,
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(20.0)),
                  padding: EdgeInsets.only(
                      top: 7.0, bottom: 7.0, right: 90.0, left: 7.0),
                  onPressed: () {},
                  child: new Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      new Image.asset(
                        'images/play.png',
                        height: 40.0,
                        width: 40.0,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10.0),
                        child: new Text(
                          "  Create a game",
                          style: TextStyle(
                              fontSize: 15.0, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  textColor: Color(0xFF292929),
                  color: Colors.blue,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 0.0, right: 0.0, top: 30.0, bottom: 0.0),
                child: FlatButton(
                  onPressed: handleSignOut,
                  child: Text(
                    "Sign out",
                    style: TextStyle(fontSize: 16.0),
                  ),
                  color: Color(0xffdd4b39),
                  textColor: Colors.white,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
