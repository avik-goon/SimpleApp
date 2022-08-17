// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:simple_app/model/auth/signup_model.dart';
import 'package:simple_app/utils/register_user.dart';

import 'button.dart';

class Register extends StatelessWidget {
  final Function addRegisteredUser;
  final UserSignUp userSignUpDetails;
  Register(
      {Key? key,
      required this.addRegisteredUser,
      required this.userSignUpDetails})
      : super(key: key);
  final TextEditingController _signupFullName = TextEditingController(text: '');
  final TextEditingController _signupMobileNumber = TextEditingController();
  final TextEditingController _signupEmail = TextEditingController(text: '');
  final TextEditingController _signupPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    _signupFullName.text = userSignUpDetails.geFullname ?? '';
    _signupMobileNumber.text = userSignUpDetails.getMobileNumber ?? '';
    _signupEmail.text = userSignUpDetails.getEmail ?? '';
    _signupPassword.text = userSignUpDetails.getEmail ?? '';
    final registerUser = RegisterUser(userSignUpDetails: userSignUpDetails);
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
                      controller: _signupFullName,
                      autocorrect: false,
                      decoration: InputDecoration(
                          hintText: 'Enter Fullname',
                          prefixIcon: Icon(Icons.account_box_outlined)),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    TextField(
                      controller: _signupMobileNumber,
                      autocorrect: false,
                      decoration: InputDecoration(
                          hintText: 'Enter Mobile Number',
                          prefixIcon: Icon(Icons.phone_android_outlined)),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    TextField(
                      controller: _signupEmail,
                      autocorrect: false,
                      decoration: InputDecoration(
                          hintText: 'Enter email address',
                          prefixIcon: Icon(Icons.email_outlined)),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    TextField(
                      controller: _signupPassword,
                      autocorrect: false,
                      decoration: InputDecoration(
                          hintText: 'Enter Password',
                          prefixIcon: Icon(Icons.lock)),
                      obscureText: true,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Button(
                        btnTxt: 'Register',
                        btnHandler: () {
                          addRegisteredUser(
                              fname: _signupFullName.text,
                              mNumber: _signupMobileNumber.text,
                              email: _signupEmail.text,
                              password: _signupPassword.text);
                          registerUser.addUserToFirebase();
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
