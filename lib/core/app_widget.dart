import 'package:PETshop/animal/animal_page.dart';
import 'package:PETshop/login/LoginPage.dart';
import 'package:PETshop/splash/splash_page.dart';
import 'package:flutter/material.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "PETshop",
      home: LoginPage(),
    );
  }
}
