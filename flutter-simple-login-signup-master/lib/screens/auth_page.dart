import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_signup/screens/EADashedBoardScreen.dart';
import 'package:login_signup/screens/LoginOrRegister.dart';

class AuthPage extends StatelessWidget{ 
  const AuthPage({super.key}); 
  @override 
  Widget build(BuildContext context){
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if(snapshot.hasData){
            return const EADashedBoardScreen();
          }else {
            return const LoginOrRegister();
          }
        }
        
        )

    );
  }
}