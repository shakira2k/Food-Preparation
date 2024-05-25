import 'package:dinnerdive/pages/Authentication/sign_in/login.dart';
import 'package:dinnerdive/widget/commontoast.dart';
import 'package:flutter/material.dart';

import '../../../functions/firebase_auth.dart';
import '../../../widget/cust_textfield.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  FirebaseFunctions firebaseFunctions = FirebaseFunctions();
  final email = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey();
  int count = 3;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SafeArea(
            child: SingleChildScrollView(
              child: Form(
                key: _formkey,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Forgot Password',
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                        Icon(Icons.edit)
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                        'Resetting your password is easy. Just tell us the email address you registered with, and we will send you an email with a link to reset your password.'),
                    const SizedBox(
                      height: 20,
                    ),
                    Cust_Textfield(email: email),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          ' $count attempt left ',
                          style: const TextStyle(color: Colors.red),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          validateTheCrediantials();
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            minimumSize: Size(width, 50)),
                        child: const Text(
                          'Reset Password',
                          style: TextStyle(color: Colors.white),
                        )),
                    const SizedBox(
                      height: 20,
                    ),

                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void validateTheCrediantials() {
    count--;
    setState(() {});
    if (count == 0) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginForm(),
          ));
    }
    bool validate = _formkey.currentState!.validate();
    if (validate == true) {
      firebaseFunctions.forgotPass(email.text);
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginForm(),
          ));
    }
    showToast(message: 'check your email');
  }
}
