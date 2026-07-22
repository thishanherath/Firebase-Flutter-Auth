import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/services/auth.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  //create object from AuthService class
  final AuthServices _auth = AuthServices();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
          actions:[
            ElevatedButton(
              onPressed: () async {
                await _auth.signOut();
              },
              child: const Text('Sign Out'),
            )
          ]
        ),
        body: const Center(child: Text('Welcome to Home Page')),
      ),
    );
  }
}