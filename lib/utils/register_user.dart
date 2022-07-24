// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:simple_app/model/auth/signup_model.dart';

class RegisterUser {
  final UserSignUp userSignUpDetails;
  const RegisterUser({required this.userSignUpDetails});
  Future addUserToFirebase() async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: userSignUpDetails.getEmail,
        password: userSignUpDetails.getPassword,
      );
      print(credential.user?.uid);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }
}
