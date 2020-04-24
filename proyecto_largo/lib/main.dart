import 'package:flare_splash_screen/flare_splash_screen.dart';
import 'package:flutter/material.dart';

import 'dashboard.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.light(),
      home: SplashScreen.navigate(
        fit: BoxFit.scaleDown,
        backgroundColor: Colors.cyan[50],
        name: "assets/intro.flr",
        next: (context) => DashboardPage(title: 'Scavengers Hunt'),
        until: () => Future.delayed(Duration(seconds: 5)),
        startAnimation: 'animated icon',
      ),
    );
  }
}
