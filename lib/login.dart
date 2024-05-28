// ignore_for_file: prefer_const_constructors, use_build_context_synchronously, prefer_const_declarations, no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:flutter_applicatin3/homepage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController user = TextEditingController();
  TextEditingController passwrd = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.5),
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: validateEmail,
                  maxLength: 20,
                  controller: user,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(45),
                    ),
                    labelText: 'user name',
                    hintText: 'Enter user name',
                    prefixIcon: const Icon(Icons.person),
                    suffixIcon: const Icon(Icons.verified_user),
                  ),
                ),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: validatepass,
                  maxLength: 20,
                  controller: passwrd,
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(45),
                    ),
                    labelText: 'Password',
                    hintText: 'Enter password',
                    prefixIcon: const Icon(Icons.key),
                    suffixIcon: const Icon(Icons.verified_user),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                    onPressed: () {
                      ckeckpassword(context);
                    },
                    child: Text(
                      'log in',
                      style: TextStyle(fontSize: 20),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> ckeckpassword(BuildContext context) async {
    String userName = user.text.trim();
    String password = passwrd.text.trim();
    if (userName == '0' && password == '0') {
      final prefs = await SharedPreferences.getInstance();
      prefs.setBool("123", true);
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => HomePagescreen(),
      ));
    } else {
      final _errorMasage = 'username or password does not match';
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(_errorMasage),
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.all(10),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  String? validateEmail(String? value) {
    final trimmedValue = value?.trim();
    if (trimmedValue == null || trimmedValue.isEmpty) {
      return 'Enter USERNAME';
    }
    return null;
  }

  String? validatepass(String? value) {
    final trimmedValue = value?.trim();

    if (trimmedValue == null || trimmedValue.isEmpty) {
      return 'Enter pass';
    }

    return null;
  }
}
