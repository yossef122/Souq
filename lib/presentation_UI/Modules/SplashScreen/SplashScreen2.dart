import 'dart:async';

// import 'dart:io';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen2 extends StatefulWidget {
  Widget start;

  SplashScreen2(
      {
        required this.start});

  @override
  State<SplashScreen2> createState() =>
      SplashScreen2State(start: start);
}

class SplashScreen2State extends State<SplashScreen2> {
  Widget start;

  SplashScreen2State(
      {
        required this.start
      });

  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
            () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => start    )))  ;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: Container(
        color: Colors.white,
        child: Center(
          child: Container(
            child: Lottie.asset('assets/animation/welcome.json'),
          ),
        ),
      ),
    );
  }

}
