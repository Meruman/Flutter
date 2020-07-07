import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:proyecto_largo/screens/home/home.dart';
import 'package:proyecto_largo/services/auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  SharedPreferences prefs;
  FirebaseUser currentUser;
  bool isLoggedIn = false;

  @override
  void initState() {
    super.initState();
    isSignIn();
  }

  void isSignIn() async {
    prefs = await SharedPreferences.getInstance();

    isLoggedIn = await _googleSignIn.isSignedIn();
    if (isLoggedIn) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Home(title: 'Scavengers Hunt')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.lightBlue,
        elevation: 0.0,
        title: Text(
          "Sign in to Hunt",
        ),
      ),
      body: Stack(
        children: <Widget>[
          Center(
            child: GoogleSignInButton(
              onPressed: () async {
                dynamic firebaseUser = await _auth.handleSignIn();
                if (firebaseUser != null) {
                  // Check is already sign up
                  final QuerySnapshot result = await Firestore.instance
                      .collection('users')
                      .where('id', isEqualTo: firebaseUser.uid)
                      .getDocuments();
                  final List<DocumentSnapshot> documents = result.documents;
                  if (documents.length == 0) {
                    // Update data to server if new user
                    Firestore.instance
                        .collection('users')
                        .document(firebaseUser.uid)
                        .setData({
                      'id': firebaseUser.uid,
                      'nickname': firebaseUser.displayName,
                      'photoUrl': firebaseUser.photoUrl,
                      'createdAt':
                          DateTime.now().millisecondsSinceEpoch.toString(),
                    });

                    //Write Data to Local

                    currentUser = firebaseUser;
                    await prefs.setString('id', currentUser.uid);
                    await prefs.setString('nickname', currentUser.displayName);
                    await prefs.setString('photoUrl', currentUser.photoUrl);
                  } else {
                    await prefs.setString('id', documents[0]['id']);
                    await prefs.setString('nickname', documents[0]['nickname']);
                    await prefs.setString('photoUrl', documents[0]['photoUrl']);
                  }
                  Fluttertoast.showToast(msg: "Sign In Success");
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              Home(title: 'Scavengers Hunt')));
                } else {
                  Fluttertoast.showToast(msg: "Sign in failed");
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
