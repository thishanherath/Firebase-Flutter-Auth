import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/models/user_model.dart';
import 'package:flutter/foundation.dart';


class AuthServices{


final FirebaseAuth _auth = FirebaseAuth.instance;



UserModel? _userFromFirebase(User? user){

  return user != null
      ? UserModel(uid: user.uid)
      : null;

}



Stream<UserModel?> get user{

 return _auth
     .authStateChanges()
     .map(_userFromFirebase);

}



Future signInAnon() async{

 try{

  UserCredential result =
      await _auth.signInAnonymously();


  return _userFromFirebase(result.user);


 }catch(e){

  debugPrint(e.toString());

  return null;

 }

}




Future registerWithEmailAndPassword(
    String email,
    String password
) async{


try{


UserCredential result =
 await _auth.createUserWithEmailAndPassword(
 email: email,
 password: password,
 );


return _userFromFirebase(result.user);



}catch(e){

debugPrint(e.toString());

return null;

}


}





Future signInWithEmailAndPassword(
String email,
String password
) async{


try{


UserCredential result =
 await _auth.signInWithEmailAndPassword(
 email: email,
 password: password,
 );


return _userFromFirebase(result.user);



}catch(e){

debugPrint(e.toString());

return null;

}


}





Future signOut() async{

try{

return await _auth.signOut();


}catch(e){

debugPrint(e.toString());

return null;

}


}


}