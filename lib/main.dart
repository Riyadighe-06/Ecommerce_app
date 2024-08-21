import 'package:e_commerce_project/home_screen.dart';
import 'package:e_commerce_project/item_details.dart';
import 'package:e_commerce_project/login_screen.dart';
import 'package:e_commerce_project/signup_screen.dart';
import 'package:e_commerce_project/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky,
        overlays: []);
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarDividerColor: Colors.transparent,
        systemNavigationBarContrastEnforced: true,
        systemNavigationBarIconBrightness: Brightness.light));
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily: 'sfprodisplay',
          textTheme: const TextTheme(
              headlineLarge: TextStyle(
                // fontFamily: "sfprodisplay",
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
              headlineMedium: TextStyle(
                // fontFamily: 'sfprodisplay',
                fontWeight: FontWeight.normal,
                fontSize: 13,
                color: Colors.black,
              ),
              headlineSmall: TextStyle(
                // fontFamily: 'sfprodisplay',
                fontWeight: FontWeight.normal,
                fontSize: 14,
                color: Colors.grey,
              ))),
      home: const Scaffold(
        body: SplashScreen(),
      ),
    );
  }
}
