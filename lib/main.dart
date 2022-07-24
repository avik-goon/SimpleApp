// ignore_for_file: avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_print, unnecessary_null_comparison, await_only_futures

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:simple_app/components/auth/login.dart';
import 'package:simple_app/components/auth/register.dart';
import 'package:simple_app/model/auth/login_model.dart';
import 'package:simple_app/model/auth/signup_model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Application',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: const MyHomePage(title: 'Simple Application'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  UserAuthDetails userLogin = UserAuthDetails();
  UserSignUp userSignUp = UserSignUp();
  void addRegisteredUser(
      {required String fname,
      required String mNumber,
      required String email,
      required String password}) {
    setState(() {
      userSignUp.setFullname = fname;
      userSignUp.setMobileNumber = mNumber;
      userSignUp.setEmail = email;
      userSignUp.setPassword = password;
    });
  }

  void checkUserSession() {
    if (FirebaseAuth.instance.currentUser?.uid == null) {
      // signed in
      print("user is not logged in");
    } else {
      print("user is logged in");
    }
  }

  @override
  Widget build(BuildContext context) {
    checkUserSession();
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              tabs: [
                Tab(icon: Icon(Icons.login_outlined)),
                Tab(icon: Icon(Icons.app_registration_outlined)),
              ],
            ),
            title: Center(
              child: Text('Simple Application'),
            ),
          ),
          body: TabBarView(
            children: [
              Login(userLogin: userLogin),
              Register(
                addRegisteredUser: addRegisteredUser,
                userSignUpDetails: userSignUp,
              )
            ],
          )),
    );
  }
}
