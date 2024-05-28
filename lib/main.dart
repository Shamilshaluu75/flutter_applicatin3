import 'package:flutter/material.dart';
import 'package:flutter_applicatin3/splash.dart';

const save_key = 'userlogin';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Demo App',
      home: SplashScreen(),
    );
  }
}
