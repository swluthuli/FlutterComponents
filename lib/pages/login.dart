import 'package:flutter/material.dart';
import '../fragments/login_form.dart';

class Login extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(child: LoginForm(),),
      ),
    );
  }
}