import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:simple_app/main.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Application',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: const DashboardPage(title: 'Simple Application'),
    );
  }
}

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

final FirebaseAuth _auth = FirebaseAuth.instance;
Future<void> _signOut() async {
  await _auth.signOut();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    // checkUserSession();
    return Scaffold(
      appBar: AppBar(
        title: const Text('DashBoard'),
      ),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.teal,
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: const Text('Dashboard'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: const Text('Contact Us'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: const Text('Help'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: const Text('Support'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: const Text('FAQ'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: const Text('Logout'),
              onTap: () {
                _signOut().then((value) {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => const MyApp()));
                });
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.bolt),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Contact Us',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.help),
            label: 'Help',
          ),
        ],
      ),
    );
  }
}
