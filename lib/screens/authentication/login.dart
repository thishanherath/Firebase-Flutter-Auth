import 'package:flutter/widgets.dart';

class Sign_In extends StatefulWidget {
  const Sign_In({super.key});

  @override
  State<Sign_In> createState() => _Sign_InState();
}

class _Sign_InState extends State<Sign_In> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        'Sign In Screen',
        style: TextStyle(fontSize: 24),
      )
    );
  }
}