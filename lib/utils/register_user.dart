// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:simple_app/model/auth/signup_model.dart';

class RegisterUser {
  final UserSignUp userSignUpDetails;
  const RegisterUser({required this.userSignUpDetails});
  void createToast(msg) {
    print(msg);
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        // timeInSecForIos: 1,
        backgroundColor: Colors.red,
        textColor: Colors.yellow);
  }

  Future addUserToFirebase() async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: userSignUpDetails.getEmail,
        password: userSignUpDetails.getPassword,
      );
      createToast(credential.user?.uid);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        createToast('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        createToast('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }
}
