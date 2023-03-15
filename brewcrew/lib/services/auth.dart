import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:brewcrew/screens/authenticate/sign_in.dart';
import 'package:brewcrew/services/database.dart';


import '../models/user.dart';
// We create an instance or a class of our login/registration so that we can communicate with the backend easily
class authservice {
 final FirebaseAuth _auth = FirebaseAuth.instance;
 // creating a user object based on Firebaseuser
 userr? _userfromFirebaseuser(User user){
   return user != null ? userr(uid : user.uid) : null;

 }
 //auth change user stream
 Stream<userr?> get user{
   return _auth.authStateChanges()
       .map(((User? user) => _userfromFirebaseuser(user!)));
 }
  //Sign in anonymously
Future signInAnon() async {
  try {
    UserCredential result = await _auth.signInAnonymously();
    User? user = result.user;
    return _userfromFirebaseuser(user!);

  }catch(e){
   print(e.toString());
   return Null;
  }
}
//Register with email and Password
  Future Register(String email,String password) async{
   try{
     UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
     User? user = result.user;
     //create a new document for the user  with the uid
     await DatabaseService(user!.uid).updateuserData('0', 'new crew member', 100);
     return _userfromFirebaseuser(user!);
   }
   catch(e){
          print(e.toString());
          return null;
   }
  }
  //Sign in functionality
  Future Sign(String email,String password) async{
    try{
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email.trim(), password: password);
      User? user = result.user;
      return _userfromFirebaseuser(user!);
    }
    catch(e){
      print(e.toString());
      return null;
    }
  }
//Sign out functionality

 Future SignOut() async{
   try{
     return await _auth.signOut();
   }catch(e){
    print(e.toString());
    return null;
   }
 }
}

