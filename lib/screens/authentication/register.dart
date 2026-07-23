import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/constants/colors.dart';
import 'package:flutter_application_1/constants/description.dart';
import 'package:flutter_application_1/constants/styles.dart';
import 'package:flutter_application_1/services/auth.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthServices _auth = AuthServices();

  //for key
  final _formKey = GlobalKey<FormState>();

  //email passowrd status
  String email = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgBlack,
      appBar: AppBar(
        backgroundColor: bgBlack,
        title: const Text('Register', style: TextStyle(color: Colors.white)),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 10),
          child: Column(
            children: [
              Text(description, style: descriptionStyle),

              Center(child: Image.network('https://img.icons8.com/?size=100&id=TjTdwE5q2APd&format=png&color=000000', width: 186, height: 186)),

              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        decoration:textInputDecoration,
                        validator: (value) =>
                            value!.isEmpty ? 'Enter an email' : null,
                        onChanged: (value) {
                          setState(() {
                            email = value;
                          });
                        },
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        decoration: textInputDecoration.copyWith(hintText: 'password'),
                        validator: (value) => value!.length < 6
                            ? 'Enter a password 6+ chars long'
                            : null,
                        obscureText: true,
                        onChanged: (value) {
                          setState(() {
                            password = value;
                          });
                        },
                      ),
                      //Google
                      const SizedBox(height: 20),
                      const Text(
                        "Login with social accounts",
                        style: descriptionStyle,
                      ),
                
                      GestureDetector(
                        onTap: () async {},
                        child: Center(
                          child: Image.network(
                            'https://img.icons8.com/?size=100&id=17949&format=png&color=000000',
                            width: 50,
                            height: 50,
                          ),
                        ),
                      ),
                
                      SizedBox(height: 20),
                
                      //register
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Don't have an account?", style: descriptionStyle),
                          const SizedBox(width: 10),
                          GestureDetector(
                            onTap: () {
                              // Navigate to the registration screen
                            },
                            child: Text(
                              "LOGIN",
                              style: TextStyle(
                                color: mainBlue,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                
                      const SizedBox(height: 20),
                
                      GestureDetector(
                        onTap: () async {
                          dynamic result = await _auth.signInAnon();
                          if (result == null) {
                            print("error signing in");
                          } else {
                            print("signed in annonymously");
                            print(result.uid);
                          }
                        },
                        child: Container(
                          height: 40,
                          width: 200,
                          decoration: BoxDecoration(
                            color: bgBlack,
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(color: mainYellow, width: 5),
                          ),
                          child: Center(child: const Text("REGISTER", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500))),
                        ),
                      ),
                
                      const SizedBox(height: 20),
                
                      
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}