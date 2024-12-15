import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:try1/main.dart';
import 'package:lottie/lottie.dart';
import 'views/names_view.dart';

class Splashscreen extends StatelessWidget {
  const Splashscreen({super.key});

  get splash => null;

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Column(
        children: [
          Center(
            child: LottieBuilder.asset(
              "assets/Lottie/heart.json",
              width: 400, // Set a specific width
              height: 400, // Set a specific height
              fit: BoxFit.contain, // Avoid overflow
            ),
          )
        ],
      ),
      nextScreen: const NamesView(),
      splashIconSize: 400,
      backgroundColor: const Color.fromARGB(255, 255, 212, 237),
    );
  }
}
