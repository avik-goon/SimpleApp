// ignore_for_file: avoid_print, use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:simple_app/model/auth/login_model.dart';
import 'package:simple_app/screens/dashboard.dart';

class LoginUser {
  final UserAuthDetails userLoginDetails;
  const LoginUser({required this.userLoginDetails});
  void loginUserWithFirebase(BuildContext context) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: userLoginDetails.getEmail ?? '',
          password: userLoginDetails.getPassword ?? '');
      print(credential.user);
      Fluttertoast.showToast(
          msg: 'Login Successful',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          // timeInSecForIos: 1,
          backgroundColor: Colors.red,
          textColor: Colors.yellow);
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const Dashboard()));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Fluttertoast.showToast(
            msg: 'No user found for that email.',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            // timeInSecForIos: 1,
            backgroundColor: Colors.red,
            textColor: Colors.yellow);
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        Fluttertoast.showToast(
            msg: 'Wrong password provided for that user.',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            // timeInSecForIos: 1,
            backgroundColor: Colors.red,
            textColor: Colors.yellow);
        print('Wrong password provided for that user.');
      }
    }
  }
}
