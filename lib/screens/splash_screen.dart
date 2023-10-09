import 'dart:async';

import 'package:flutter/material.dart';
import 'package:media/pages/main_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const MainPage(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 20),
              SizedBox(
                width: double.maxFinite,
                child: Image(
                  image: AssetImage(
                    'assets/splash-icon.png',
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'WELCOME',
                style: TextStyle(
                  fontSize: 30,
                  letterSpacing: 8,
                  color: Colors.black54,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
