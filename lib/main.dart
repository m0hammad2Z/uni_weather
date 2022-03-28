import 'package:flutter/material.dart';
import 'package:uni_weathar/HomePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //theme: ThemeData(
      //  primarySwatch: Colors.blue,
      //),
      home: HomePage(),
    );
  }
}
