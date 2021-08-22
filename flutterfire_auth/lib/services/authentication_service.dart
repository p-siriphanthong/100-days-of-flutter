import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn _google = GoogleSignIn();
final FacebookAuth _facebook = FacebookAuth.instance;

FirebaseAuth getFirebaseAuth() {
  return _auth;
}

Future<UserCredential> signUpWithEmailAndPassword({
  required String email,
  required String password,
}) {
  return _auth.createUserWithEmailAndPassword(email: email, password: password);
}

Future<UserCredential> signInWithEmailAndPassword({
  required String email,
  required String password,
}) {
  return _auth.signInWithEmailAndPassword(email: email, password: password);
}

Future<UserCredential?> signInWithGoogle() async {
  final GoogleSignInAccount? googleUser = await _google.signIn();

  if (googleUser != null) {
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    return FirebaseAuth.instance.signInWithCredential(credential);
  }
}

Future<UserCredential?> signInWithFacebook() async {
  final LoginResult loginResult = await _facebook.login();

  if (loginResult.accessToken != null) {
    final OAuthCredential credential =
        FacebookAuthProvider.credential(loginResult.accessToken!.token);

    return FirebaseAuth.instance.signInWithCredential(credential);
  }
}

Future<void> signOut() {
  _google.signOut();
  _facebook.logOut();

  return _auth.signOut();
}
