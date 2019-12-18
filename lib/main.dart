import 'pages/home_page.dart';
import './pages/register.dart';
import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Ke-Taxi',
      theme: new ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: new Register(),
    );
  }
}