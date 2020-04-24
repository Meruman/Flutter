import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';

class DashboardPage extends StatefulWidget {
  DashboardPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _DashboardPage createState() => _DashboardPage();
}

class _DashboardPage extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        leading: FlareActor("assets/proyecto_largo.flr",
            animation: "animated icon",
            fit: BoxFit.scaleDown,
            alignment: Alignment.center),
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          int count = 2;
          if (orientation == Orientation.landscape) {
            count = 3;
          }
          return GridView.count(
            crossAxisCount: count,
            children: <Widget>[
              Card(
                margin: EdgeInsets.all(20.0),
                child: RaisedButton.icon(
                  color: Colors.cyan[100],
                  onPressed: () {},
                  label: Text(''),
                  icon: Icon(
                    Icons.search,
                    size: 80,
                    color: Colors.black87,
                  ),
                ),
              ),
              RaisedButton.icon(
                onPressed: () {},
                label: Text('Park Out', style: TextStyle(fontSize: 15.0)),
                icon: Icon(Icons.eject),
              ),
              RaisedButton.icon(
                onPressed: () {},
                label:
                    Text('Maintainence In', style: TextStyle(fontSize: 15.0)),
                icon: Icon(Icons.vertical_align_bottom),
              ),
              RaisedButton.icon(
                onPressed: () {},
                label:
                    Text('Maintainence Out', style: TextStyle(fontSize: 15.0)),
                icon: Icon(Icons.vertical_align_top),
              ),
              RaisedButton.icon(
                onPressed: null,
                label: Text('Move', style: TextStyle(fontSize: 15.0)),
                icon: Icon(Icons.open_with),
              ),
            ],
          );
        },
      ),
    );
  }
}
