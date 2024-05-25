import 'package:dinnerdive/pages/Authentication/sign_in/login.dart';
import 'package:dinnerdive/pages/drawer/hidden_drawer.dart';
import 'package:dinnerdive/widget/commontoast.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import "package:lottie/lottie.dart";

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void checkLogin() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    final userLoginCred = pref.getBool('isLoggedIn');
    if (userLoginCred == true) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const HiddenDrawer(),
          ));

      showToast(message: 'welcome');
    } else {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginForm(),
          ));
      showToast(message: 'Please login');
    }
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3)).whenComplete(() => checkLogin());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset("assets/anim1.json"),
      ),
    );
  }
}
