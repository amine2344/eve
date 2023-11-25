import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('images/Rwhite.png', width: 150, height: 150), // Replace 'assets/your_logo.png' with the path to your app's logo
            const SizedBox(height: 20),
            const Text(
              '',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0 ,color: Colors.white),
            ),
            
          ],
        ),
      ),
      
    );
    
  }
}
