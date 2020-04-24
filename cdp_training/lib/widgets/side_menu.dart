import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'dart:math';

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int rng = new Random().nextInt(6) + 1;
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: FlareActor("images/intro.flr",
                animation: "cdp",
                fit: BoxFit.fill,
                alignment: Alignment.bottomCenter),
            decoration: BoxDecoration(
                color: Colors.black87,
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('images/background_$rng.jpg'))),
          ),
          ListTile(
            leading: Icon(Icons.input),
            title: Text('Welcome'),
            onTap: () => {},
          ),
          ListTile(
            leading: Icon(Icons.verified_user),
            title: Text('Profile'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: () => {Navigator.of(context).pop()},
          ),
        ],
      ),
    );
  }
}
