import 'package:firebase_auth/firebase_auth.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

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

Future<void> signOut() {
  return _auth.signOut();
}
