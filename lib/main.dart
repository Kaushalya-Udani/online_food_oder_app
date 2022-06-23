import 'package:flutter/material.dart';
import 'package:food_oder_app/screen/login_page.dart';
import 'package:food_oder_app/screen/sign_up.dart';
import 'package:food_oder_app/screen/welcome_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
      ),
      home: SignUp(),
    );
  }
}
