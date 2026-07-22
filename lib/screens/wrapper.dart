import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/UserModel.dart';
import 'package:flutter_application_1/screens/authentication/authenticate.dart';
import 'package:flutter_application_1/screens/home/home.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    //user data thet the provider proivides this can be a user data or can be null
    final user = Provider.of<UserModel?>(context);

    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}
