import 'package:firebase_auth/firebase_auth.dart';

class UserFirebase {
  final FirebaseAuth _firebaseAuth;

  UserFirebase() : _firebaseAuth = FirebaseAuth.instance;
  void createAccountFirebase(String email, String password) {
    _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  void signinFirebase(String email, String password) {
    try {
      _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) {
        print(value.user.uid);
      }).catchError((onError) {});
    } catch (e) {
      print(e);
    }
  }
}
