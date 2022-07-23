// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:simple_app/components/Auth/button.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(28.0),
            child: Column(
              children: const [
                TextField(
                  autocorrect: false,
                  decoration: InputDecoration(
                      hintText: 'Enter user name',
                      prefixIcon: Icon(Icons.account_box_outlined)),
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
                  height: 20,
                ),
                Button(btnTxt: 'LogIn'),
              ],
            ),
          )
        ],
      ),
    );
  }
}
