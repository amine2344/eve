import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:login_signup/screens/EADashedBoardScreen.dart';
import 'package:login_signup/screens/auth_page.dart';

import 'package:firebase_core/firebase_core.dart';

import 'firebase_options.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized(); 
  await Firebase.initializeApp(
    options:  DefaultFirebaseOptions.currentPlatform,

  );
  
  runApp(const MyApp());



}



late _MyAppState settingUI;
class MyApp extends StatefulWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
   return  MaterialApp(
     initialRoute: '/', // Set your initial route (if needed).
     
     
    
     home: AdaptiveTheme(
      light: ThemeData.light(useMaterial3: true),
      dark: ThemeData.dark(useMaterial3: true),
      initial: AdaptiveThemeMode.light,
      builder: (theme, darkTheme) => MaterialApp(
        
        
        title: 'login',
        theme: theme,
        darkTheme: darkTheme,
        home: const AuthPage(),
      ),
    ),);
  }
  @override
  _MyAppState createState() => _MyAppState();
  // This widget is the root of your application.

}

class _MyAppState extends State<MyApp> {
  
  Color primaryColor = Colors.blue;
  Color accentColor = Colors.blue;
  bool isDarkMode = true;

  void callSetState() {
    setState(() {
      isDarkMode =  !isDarkMode ;
    });
  }

  @override
  Widget build(BuildContext context) {
    settingUI = this;

    
     return MaterialApp(
       initialRoute: '/', // Set your initial route (if needed).
     
     
     
       home:  WillPopScope(
    onWillPop: () async {
      // Handle the back button press as needed
      // For example, you can show a confirmation dialog before allowing navigation.
      // If you want to navigate back without confirmation, simply return true.
      return true; // Return false to prevent navigation
    },
  child: AdaptiveTheme(
      light: ThemeData.light(useMaterial3: true),
      dark: ThemeData.dark(useMaterial3: true),
      initial: AdaptiveThemeMode.light,
      builder: (theme, darkTheme) => MaterialApp(
       
         title: 'login',
        theme: theme,
        darkTheme: darkTheme,
        home: const AuthPage(),
      ),
    ),),);
  }
}


