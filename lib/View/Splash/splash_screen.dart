import 'dart:async';

import 'package:e_commerce_project/home_screen.dart';
import 'package:e_commerce_project/shared_preference/shared_pref.dart';
import 'package:e_commerce_project/signup_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
      if (SharedPreferance.GetIsLogin() == true) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const HomeScreen()));
      } else {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const SignUpScreen()));
      }
    }
        // () => Navigator.pushReplacement(context,
        //     MaterialPageRoute(builder: (context) => const SignUpScreen())),
        );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              Center(
                child: Image.asset(
                  "assets/splash_logo.png",
                  width: MediaQuery.of(context).size.width * 0.7,
                ),
              ),
              Positioned(
                bottom: 0,
                child: Image.asset(
                  "assets/Group 195.png",
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ));
  }
}
