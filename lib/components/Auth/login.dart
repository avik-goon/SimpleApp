// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables, void_checks, avoid_print

import 'package:flutter/material.dart';
import 'package:simple_app/components/auth/button.dart';

import '../../model/auth/login_model.dart';
import '../../utils/login_user.dart';

class Login extends StatelessWidget {
  final UserAuthDetails userLogin;
  Login({Key? key, required this.userLogin}) : super(key: key);

  final TextEditingController _loginEmail = TextEditingController(text: '');
  final TextEditingController _loginPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    _loginEmail.text = userLogin.getEmail ?? '';
    _loginPassword.text = userLogin.getEmail ?? '';
    return Center(
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(28.0),
                child: Column(
                  children: [
                    TextField(
                      controller: _loginEmail,
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
                      controller: _loginPassword,
                      decoration: InputDecoration(
                          hintText: 'Enter Password',
                          prefixIcon: Icon(Icons.lock)),
                      obscureText: true,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Button(
                        btnTxt: 'LogIn',
                        btnHandler: () {
                          if (_loginEmail.text.isNotEmpty &&
                              _loginPassword.text.isNotEmpty) {
                            userLogin.setEmail = _loginEmail.text;
                            userLogin.setPassword = _loginPassword.text;
                            LoginUser(userLoginDetails: userLogin)
                                .loginUserWithFirebase();
                          } else {
                            print("Fields are empty");
                          }
                        }),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
