// ignore_for_file: annotate_overrides, prefer_const_constructors, use_build_context_synchronously, no_leading_underscores_for_local_identifiers, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_applicatin3/homepage.dart';
import 'package:flutter_applicatin3/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    loginPage();
    checkLogin(context);
    super.initState();
  }

  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Image.asset('lib/assets/images/zw-toyota-fortuner-2020-3_lead.webp'),
      ),
    );
  }

  void loginPage() async {
    await Future.delayed(Duration(seconds: 4));
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => LoginScreen(),
        ));
  }

  void HomePage() async {
    await Future.delayed(const Duration(seconds: 3));
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomePagescreen(),
        ));
  }

  Future<void> checkLogin(BuildContext context) async {
    final _shared = await SharedPreferences.getInstance();
    final _login = _shared.getBool('123');
    if (_login == null || _login == false) {
      loginPage();
    } else {
      HomePage();
    }
  }
}
