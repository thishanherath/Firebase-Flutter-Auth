import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/models/UserModel.dart';

class AuthServices{

  //firebase auth instance
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //create a user from firebase user with uid
  UserModel? _userWithFirebaseUserUid(User? user){
    return user != null ? UserModel(uid: user.uid) : null;
  }

  //create the stream for checking the auth changes in the user
  Stream<UserModel?> get user{
    return _auth.authStateChanges().map(_userWithFirebaseUserUid);
  }


  //Signin anonymouse
  Future signInAnon() async{
    try{
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return _userWithFirebaseUserUid(user);
    }catch(e){
      print(e.toString());
      return null;
    }
  }

  //signout
  Future signOut() async{
    try{
      return await _auth.signOut();
    }catch(e){
      print(e.toString());
      return null;
    }
  }

}