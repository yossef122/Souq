import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:souq/presentation_UI/Modules/SplashScreen/SplashScreen2.dart';

class Splash_Screen extends StatefulWidget {
  Widget start;

  Splash_Screen({required this.start});

  @override
  State<Splash_Screen> createState() => Splash_ScreenState(start: start);
}

class Splash_ScreenState extends State<Splash_Screen> {
  Widget start;

  Splash_ScreenState({required this.start});

  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 6),
      () => Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => SplashScreen2(
            start: start,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: Column(
                children: [
                  SizedBox(
                    // width: 200.0,
                    child: TextLiquidFill(
                      text: 'Souq',
                      waveColor: Colors.blueAccent,
                      boxBackgroundColor: Colors.white,
                      textStyle: const TextStyle(
                        fontFamily: 'Lobster',
                        fontSize: 80.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      boxHeight: 100.0,
                    ),
                  ),
                  Lottie.asset('assets/animation/splash_commerce-3d.json',
                      height: 500),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
