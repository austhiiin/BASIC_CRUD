// lib/main.dart
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:try1/splashscreen.dart';
import 'views/names_view.dart';
import 'package:lottie/lottie.dart';
import 'splashscreen.dart';

void main() async {
  // Ensure Flutter is initialized
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Supabase
  await Supabase.initialize(
    url: 'https://tngeeuzulhgyszjviezk.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InRuZ2VldXp1bGhneXN6anZpZXprIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzM1NTQ3NTYsImV4cCI6MjA0OTEzMDc1Nn0.jLViOrVMcbUCykSkCgJuiJJTspwu8xRWTmNJFj_QyMY',
  );

  // Run the app
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Splashscreen(),
    );
  }
}
