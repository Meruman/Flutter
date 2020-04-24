import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey[850],
          centerTitle: true,
          title: Text('I am Batman'),
        ),
        body: Center(
          child: Image(
            image: AssetImage('images/batmans.jpg'),
          ),
        ),
        backgroundColor: Colors.blueGrey[900],
      ),
    ));
