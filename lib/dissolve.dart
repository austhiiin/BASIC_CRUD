import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'views/names_view.dart';

class DeletingScreen extends StatelessWidget {
  const DeletingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Lottie.asset(
              "assets/Lottie/animation-1.json",
              width: 800, // Set a specific width
              height: 100, // Set a specific height
              fit: BoxFit.contain, // Avoid overflow
            ),
          ),
        ],
      ),
      nextScreen: const NamesView(),
      backgroundColor: const Color.fromARGB(255, 255, 219, 246),
      duration: 3000, // Duration of splash screen (5 seconds)
    );
  }
}
