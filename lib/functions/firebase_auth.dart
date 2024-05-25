


import 'package:dinnerdive/pages/Authentication/sign_in/login.dart';
import 'package:dinnerdive/pages/drawer/hidden_drawer.dart';
import 'package:dinnerdive/widget/commontoast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FirebaseFunctions{


  Future<void> createAccount(String email, String password,BuildContext context,String name) async {
    try {

      // Create a new user with Firebase Authentication
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (userCredential.user != null) {

        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setBool('isLoggedIn', true);
        await prefs.setString('name', name);
        await prefs.setString('email', email);
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HiddenDrawer(),));
      }
    } catch (e) {
      throw Exception('Failed to create account');
    }
  }

  Future<void> signIn(String email, String password,BuildContext context) async {
    try {
      // Sign in with Firebase Authentication
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (userCredential.user != null) {
        // Login successful, store the bool in shared preferences
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setBool('isLoggedIn', true);
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HiddenDrawer(),));
      }
    } catch (e) {
      showToast(message: e.toString());
    }
  }
  Future forgotPass(String email)async{
    try{
      FirebaseAuth auth = FirebaseAuth.instance;
      await auth.sendPasswordResetEmail(email:email);
    }
    catch(e){
      showToast(message: e.toString());
    }
  }

  static Future<Map<String,String?>> displayUser()async{
    SharedPreferences user=await SharedPreferences.getInstance();
     String? name=user.getString('name');
    String? email=user.getString('email');
    var data={'name':name,'email':email};
    return data;


  }
  static Future<void> setUser({required name,required email})async{
    SharedPreferences user=await SharedPreferences.getInstance();
    user.setString('name',name);
    user.setString('email',email);
    displayUser();

  }
  static Future userLogout(BuildContext context)async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', false);
    FirebaseAuth auth = FirebaseAuth.instance;
    auth.signOut().then((value) => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>const LoginForm() ,)));

  }



}