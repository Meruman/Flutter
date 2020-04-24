import 'package:cdp_training/models/user.dart';
import 'package:cdp_training/screens/auth/authentication.dart';
import 'package:cdp_training/screens/home/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    //Return either home or authenticate widget
    if (user == null) {
      return Authenticate();
    } else {
      return Dashboard();
    }
  }
}
