import 'package:firebase_auth/firebase_auth.dart';

class AuthServices{

  //firebase auth instance
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //Signin anonymouse
  Future signInAnon() async{
    try{
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return user;
    }catch(e){
      print(e.toString());
      return null;
    }
  }

  //


}