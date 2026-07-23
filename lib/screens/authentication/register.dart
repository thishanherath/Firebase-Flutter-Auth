import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/colors.dart';
import 'package:flutter_application_1/constants/description.dart';
import 'package:flutter_application_1/constants/styles.dart';
import 'package:flutter_application_1/services/auth.dart';

class Register extends StatefulWidget {
  final Function toggle;

  const Register({super.key, required this.toggle});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthServices _auth = AuthServices();

  final _formKey = GlobalKey<FormState>();

  String email = "";
  String password = "";

  Future<void> register() async {
    if (_formKey.currentState!.validate()) {

      // TODO: Replace with email registration method
      dynamic result =
 await _auth.registerWithEmailAndPassword(
   email,
   password,
 );

      if (!mounted) return;

      if (result == null) {
        debugPrint("Registration failed");
      } else {
        debugPrint("Registration successful");
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
        title: const Text(
          'Register',
          style: TextStyle(color: Colors.white),
        ),
        elevation: 0,
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 15,
            right: 10,
          ),

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
                        decoration: textInputDecoration,

                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Enter an email';
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
                          hintText: 'password',
                        ),

                        obscureText: true,

                        validator: (value) {
                          if (value == null || value.length < 6) {
                            return 'Enter a password 6+ chars long';
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
                        onTap: () async {

                          dynamic result =
                              await _auth.signInAnon();

                          if (!mounted) return;

                          if (result == null) {
                            debugPrint("Google login failed");
                          }

                        },

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
                        mainAxisAlignment:
                            MainAxisAlignment.center,

                        children: [

                          Text(
                            "Already have an account?",
                            style: descriptionStyle,
                          ),


                          const SizedBox(width: 10),


                          GestureDetector(

                            onTap: () {
                              widget.toggle();
                            },

                            child: Text(
                              "LOGIN",
                              style: TextStyle(
                                color: mainBlue,
                                fontWeight:
                                    FontWeight.w600,
                              ),
                            ),

                          ),
                        ],
                      ),


                      const SizedBox(height: 20),


                      GestureDetector(

                        onTap: register,

                        child: Container(

                          height: 40,
                          width: 200,

                          decoration: BoxDecoration(

                            color: bgBlack,

                            borderRadius:
                                BorderRadius.circular(100),

                            border: Border.all(
                              color: mainYellow,
                              width: 5,
                            ),

                          ),

                          child: const Center(

                            child: Text(
                              "REGISTER",

                              style: TextStyle(
                                color: Colors.white,
                                fontWeight:
                                    FontWeight.w500,
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