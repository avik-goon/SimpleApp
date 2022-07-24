// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:simple_app/components/auth/button.dart';

class Register extends StatelessWidget {
  const Register({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(28.0),
            child: Column(
              children: [
                TextField(
                  autocorrect: false,
                  decoration: InputDecoration(
                      hintText: 'Enter Fullname',
                      prefixIcon: Icon(Icons.account_box_outlined)),
                ),
                SizedBox(
                  height: 30,
                ),
                TextField(
                  autocorrect: false,
                  decoration: InputDecoration(
                      hintText: 'Enter Mobile Number',
                      prefixIcon: Icon(Icons.phone_android_outlined)),
                ),
                SizedBox(
                  height: 30,
                ),
                TextField(
                  autocorrect: false,
                  decoration: InputDecoration(
                      hintText: 'Enter email address',
                      prefixIcon: Icon(Icons.email_outlined)),
                ),
                SizedBox(
                  height: 30,
                ),
                TextField(
                  autocorrect: false,
                  decoration: InputDecoration(
                      hintText: 'Enter Password', prefixIcon: Icon(Icons.lock)),
                  obscureText: true,
                ),
                SizedBox(
                  height: 30,
                ),
                Button(btnTxt: 'Register', btnHandler: () {}),
              ],
            ),
          )
        ],
      ),
    );
  }
}
