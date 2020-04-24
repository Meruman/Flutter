import 'package:cdp_training/models/user.dart';
import 'package:cdp_training/screens/wrapper.dart';
import 'package:cdp_training/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:flare_splash_screen/flare_splash_screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData.dark(),
        home: SplashScreen.navigate(
          fit: BoxFit.scaleDown,
          backgroundColor: Colors.black54,
          name: "images/intro.flr",
          next: (context) => Wrapper(),
          until: () => Future.delayed(Duration(seconds: 2)),
          startAnimation: 'cdp',
        ),
      ),
    );
  }
}
