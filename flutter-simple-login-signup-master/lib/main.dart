import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:login_signup/components/login_page.dart';
import 'package:sqflite/sqflite.dart';



void main() async {
  
  runApp(const MyApp());



}



late _MyAppState settingUI;
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  
  @override
  Widget build(BuildContext context) {
   return AdaptiveTheme(
      light: ThemeData.light(useMaterial3: true),
      dark: ThemeData.dark(useMaterial3: true),
      initial: AdaptiveThemeMode.dark,
      builder: (theme, darkTheme) => MaterialApp(
        
        theme: theme,
        darkTheme: darkTheme,
        home: LoginPage(),
      ),
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
    setState(() {
      isDarkMode =  !isDarkMode ;
    });
  }

  @override
  Widget build(BuildContext context) {
    settingUI = this;
     return AdaptiveTheme(
      light: ThemeData.light(useMaterial3: true),
      dark: ThemeData.dark(useMaterial3: true),
      initial: AdaptiveThemeMode.dark,
      builder: (theme, darkTheme) => MaterialApp(
        title: 'Setting ui',
        theme: theme,
        darkTheme: darkTheme,
        home: LoginPage(),
      ),
    );
  }
}

