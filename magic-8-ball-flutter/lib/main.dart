import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(MaterialApp(home: MagicBallBase()));

class MagicBallBase extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[400],
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue[800],
        title: Text("Ask Me Anything"),
      ),
      body: MagicalBall(),
    );
  }
}

class MagicalBall extends StatefulWidget {
  @override
  _MagicalBallState createState() => _MagicalBallState();
}

class _MagicalBallState extends State<MagicalBall> {
  int answerNumber = 1;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: FlatButton(
          onPressed: () {
            setState(() {
              answerNumber = Random().nextInt(5) + 1;
            });
          },
          child: Image.asset('images/ball$answerNumber.png'),
        ),
      ),
    );
  }
}
