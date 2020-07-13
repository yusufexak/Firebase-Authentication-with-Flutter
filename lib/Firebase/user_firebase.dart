import 'package:firebase_auth/firebase_auth.dart';

class UserFirebase {
  final FirebaseAuth _firebaseAuth;

  UserFirebase() : _firebaseAuth = FirebaseAuth.instance;
  void createAccountFirebase(String email, String password) {
    _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
  }
}
