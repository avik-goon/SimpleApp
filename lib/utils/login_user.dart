// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:simple_app/model/auth/login_model.dart';

class LoginUser {
  final UserAuthDetails userLoginDetails;
  const LoginUser({required this.userLoginDetails});
  void loginUserWithFirebase() async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: userLoginDetails.getEmail ?? '',
          password: userLoginDetails.getPassword ?? '');
      print(credential.user);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }
}
