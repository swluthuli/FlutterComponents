import 'package:flutter/material.dart';
import '../fragments/regester_form.dart';

class Register extends StatelessWidget {
  static const String _title = 'Registration';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        body: Center(child: RegisterForm(),),
      ),
    );
  }
}