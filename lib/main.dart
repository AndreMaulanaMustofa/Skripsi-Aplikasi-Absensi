import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:absen_polinema/content/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimatedSplashScreen(
        duration: 3000,
        splash: Image.asset('img/polinema_logo.png'),
        nextScreen: const loginPage(),
        splashTransition: SplashTransition.scaleTransition,
        pageTransitionType: PageTransitionType.leftToRight,
        backgroundColor: const Color.fromARGB(255, 14, 26, 197),
      ),
    );
  }
}
