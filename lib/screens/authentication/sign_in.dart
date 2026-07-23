import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/colors.dart';
import 'package:flutter_application_1/constants/description.dart';
import 'package:flutter_application_1/constants/styles.dart';
import 'package:flutter_application_1/services/auth.dart';

class SignIn extends StatefulWidget {
  final Function toggle;

  const SignIn({super.key, required this.toggle});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthServices _auth = AuthServices();

  final _formKey = GlobalKey<FormState>();

  String email = "";
  String password = "";

  Future<void> signIn() async {
    if (_formKey.currentState!.validate()) {
      dynamic result = await _auth.signInWithEmailAndPassword(email, password);

      if (!mounted) return;

      if (result == null) {
        debugPrint("Error signing in");
      } else {
        debugPrint("Signed in anonymously");
        debugPrint(result.uid);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgBlack,
      appBar: AppBar(
        backgroundColor: bgBlack,
        title: const Text('Sign In'),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 10),
          child: Column(
            children: [
              Text(
                description,
                style: descriptionStyle,
              ),

              Center(
                child: Image.network(
                  'https://img.icons8.com/?size=100&id=TjTdwE5q2APd&format=png&color=000000',
                  width: 186,
                  height: 186,
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: textInputDecoration.copyWith(
                          hintText: "Email",
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Enter an email";
                          }
                          return null;
                        },
                        onChanged: (value) {
                          email = value;
                        },
                      ),

                      const SizedBox(height: 20),

                      TextFormField(
                        decoration: textInputDecoration.copyWith(
                          hintText: "Password",
                        ),
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.length < 6) {
                            return "Enter a password 6+ chars long";
                          }
                          return null;
                        },
                        onChanged: (value) {
                          password = value;
                        },
                      ),

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

                      const SizedBox(height: 20),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account?",
                            style: descriptionStyle,
                          ),

                          const SizedBox(width: 10),

                          GestureDetector(
                            onTap: () {
                              widget.toggle();
                            },
                            child: Text(
                              "REGISTER",
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
                        onTap: signIn,
                        child: Container(
                          height: 40,
                          width: 200,
                          decoration: BoxDecoration(
                            color: bgBlack,
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(
                              color: mainYellow,
                              width: 5,
                            ),
                          ),
                          child: const Center(
                            child: Text(
                              "LOG IN",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 20),

                      GestureDetector(
                        onTap: () async {
                          dynamic result = await _auth.signInAnon();

                          if (!mounted) return;

                          if (result == null) {
                            debugPrint("Error guest login");
                          } else {
                            debugPrint("Guest login successful");
                            debugPrint(result.uid);
                          }
                        },
                        child: Container(
                          height: 40,
                          width: 200,
                          decoration: BoxDecoration(
                            color: bgBlack,
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(
                              color: mainYellow,
                              width: 5,
                            ),
                          ),
                          child: const Center(
                            child: Text(
                              "LOG AS GUEST",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
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