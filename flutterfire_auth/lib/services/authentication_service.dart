import 'package:firebase_auth/firebase_auth.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

Future<UserCredential> signUpWithEmailAndPassword({
  required String email,
  required String password,
}) {
  return _auth.createUserWithEmailAndPassword(email: email, password: password);
}
