import 'dart:async';
import 'package:ca_services/screens/bottom_navigation.dart';
import 'package:ca_services/screens/home/home_page_screen.dart';
import 'package:ca_services/screens/start_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../res/strings.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double _opacity = 0.0;

 @override
  void initState() {
    super.initState();
    checkLogin();
  }

  checkLogin() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();


    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        _opacity = 1.0;
      });
    });
    Timer(const Duration(seconds: 3 + 1), () async {
      if (preferences.getBool(isLoggedIn) ?? false) {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const MyBottomNavigation()));
      } else {
         Navigator.of(context).pushReplacement(
           MaterialPageRoute(builder: (context) => const StartScreen()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEAF1F8),
      body: Center(
        child: AnimatedOpacity(
          opacity: _opacity,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeIn,
          child: Center(child: Image.asset('assets/logo.png', width: 250)),
        ), // You can replace this with your image/logo
      ),
    );
  }
}
