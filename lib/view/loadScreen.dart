import 'package:flutter/material.dart';
import 'package:hinergi_kwh_meter/view/user/loginPage.dart';
import 'package:hinergi_kwh_meter/view/user/registerPage.dart';
import 'package:hinergi_kwh_meter/view/welcomeScreen.dart';

class loadScreen extends StatefulWidget {
  @override
  _loadScreenState createState() => _loadScreenState();
}

class _loadScreenState extends State<loadScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // body: MyApp(),
        // body: LoginPage(),
        body: RegistrationPage(),
      ),
    );
  }
}
