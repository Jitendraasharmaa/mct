import 'package:flutter/material.dart';
import 'package:mct_prayer_book/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MCT Prayer Book',
      home: const SplashScreen(),
    );
  }
}
