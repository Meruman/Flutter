import 'package:flutter/material.dart';

class VentanaDescripcion extends StatelessWidget {
  VentanaDescripcion(String title) {
    this.title = title;
  }
  String title;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
    );
  }
}
