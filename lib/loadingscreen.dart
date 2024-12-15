import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'views/names_view.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Lottie.asset(
              "assets/Lottie/sparkle.json",
              width: MediaQuery.of(context).size.width *
                  1.0, // Set width to 50% of the screen width
              height: MediaQuery.of(context).size.width *
                  0.2, // Set height to 50% of the screen width
              fit: BoxFit.contain, // Avoid overflow
            ),
          ),
        ],
      ),
      nextScreen: const NamesView(),
      backgroundColor: const Color.fromARGB(255, 228, 0, 171),
      duration: 3000, // Duration of splash screen (5 seconds)
    );
  }
}
