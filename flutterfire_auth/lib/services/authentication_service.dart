import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:twitter_login/twitter_login.dart';
import 'package:twitter_login/entity/auth_result.dart';

import 'package:flutterfire_auth/config.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn _google = GoogleSignIn();
final FacebookAuth _facebook = FacebookAuth.instance;
final TwitterLogin _twitter = TwitterLogin(
  apiKey: twitterApiKey,
  apiSecretKey: twitterApiSecretKey,
  redirectURI: 'flutterfire-auth://',
);

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

Future<UserCredential?> signInWithTwitter() async {
  final AuthResult authResult = await _twitter.login();

  if (authResult.status == TwitterLoginStatus.loggedIn) {
    final credential = TwitterAuthProvider.credential(
      accessToken: authResult.authToken!,
      secret: authResult.authTokenSecret!,
    );

    return FirebaseAuth.instance.signInWithCredential(credential);
  }
}

Future<void> signOut() {
  _google.signOut();
  _facebook.logOut();

  return _auth.signOut();
}
