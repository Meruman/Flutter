import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  //Sign in with google
  Future<FirebaseUser> handleSignIn() async {
    try {
      final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.getCredential(
          idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);
      final FirebaseUser firebaseUser =
          (await firebaseAuth.signInWithCredential(credential)).user;
      print("signed in " + firebaseUser.displayName);
      return firebaseUser;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
