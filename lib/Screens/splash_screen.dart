import 'package:flutter/material.dart';
import 'package:kishan_se/Screens/HomeScreen.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Simulate a delay for the splash screen
    Future.delayed(const Duration(seconds: 20), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    });

    return Scaffold(
      body: Stack(
        children: [
          // Full-screen image
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/SplashScreen.jpg'), // Replace with your image path
                fit: BoxFit.fill,
              ),
            ),
          ),
        ],
      ),
    );
  }
}