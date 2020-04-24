import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

void main() => runApp(TitleBar());

class TitleBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Bandersnach Stories",
            style: TextStyle(fontFamily: 'Pacifico'),
          ),
          backgroundColor: Colors.blue[200],
        ),
        body: BodyPart(),
      ),
    );
  }
}

class BodyPart extends StatefulWidget {
  @override
  _BodyPartState createState() => _BodyPartState();
}

class _BodyPartState extends State<BodyPart> {
  FlatButton makeButton() {
    return FlatButton(
      padding: EdgeInsets.all(0.0),
      child: CircleAvatar(
        radius: 40,
        backgroundColor: Colors.blue,
      ),
      onPressed: () {},
    );
  }

  Row makeRows() {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          makeButton(),
          makeButton(),
          makeButton(),
          makeButton(),
        ]);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        makeRows(),
        makeRows(),
        makeRows(),
        makeRows(),
        makeRows(),
        makeRows(),
      ],
    );
  }
}
