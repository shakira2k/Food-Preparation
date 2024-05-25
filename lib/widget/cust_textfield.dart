import 'package:flutter/material.dart';
// The custom widgett

class Cust_Textfield extends StatelessWidget {
  const Cust_Textfield({
    super.key,
    required this.email,
  });

  final TextEditingController email;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: email,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: Colors.red),
        ),
        enabled: true,
        labelText: 'Enter Email',
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: Colors.red),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: Colors.red),
        ),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Enter a valid email';
        } else if (!value.contains('@') || !value.contains('.com')) {
          return 'Enter a valid email';
        } else {
          return null;
        }
      },
    );
  }
}
