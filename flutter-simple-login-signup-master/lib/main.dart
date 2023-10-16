import 'package:flutter/material.dart';
import 'package:login_signup/components/login_page.dart';

import 'package:flutter/cupertino.dart';

import 'package:login_signup/screens/settings_screen.dart';
import 'package:login_signup/utils/theme_data.dart';

void main() {
  runApp(const MyApp());
}

late _MyAppState settingUI;
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LoginPage(),
    );
  }
  @override
  _MyAppState createState() => _MyAppState();
  // This widget is the root of your application.

}

class _MyAppState extends State<MyApp> {
  Color primaryColor = Colors.blueAccent;
  Color accentColor = Colors.blueAccent;
  bool isDarkMode = true;

  void callSetState() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    settingUI = this;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Settings UI',
      
      home: const LoginPage(),
    );
  }
}

