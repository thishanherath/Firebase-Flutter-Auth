import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/services/auth.dart';

class Sign_In extends StatefulWidget {
  const Sign_In({super.key});

  @override
  State<Sign_In> createState() => _Sign_InState();
}

class _Sign_InState extends State<Sign_In> {
  //ref for the AuthService class
  final AuthServices _auth = AuthServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sign In')),
      body: ElevatedButton(
        onPressed: () async {
          dynamic result = await _auth.signInAnon();
          if (result == Null) {
            print("error signing in");
          } else {
            print("signed in annonymously");
            print(result.uid);
          }
        },
        child: const Text('Sign In Anonymously'),
      ),
    );
  }
}
