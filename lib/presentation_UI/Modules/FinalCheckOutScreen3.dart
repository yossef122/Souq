import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:souq/presentation_UI/Layout_Screen/LayOut_Screen.dart';

class FinalCheckOutScreen3 extends StatefulWidget {
  const FinalCheckOutScreen3({Key? key}) : super(key: key);

  @override
  State<FinalCheckOutScreen3> createState() => _FinalCheckOutScreen3State();
}

class _FinalCheckOutScreen3State extends State<FinalCheckOutScreen3> {
  @override
  void initState() {
    super.initState();

    Timer(
        Duration(seconds: 5),
        () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => LayOut_Screen(
                  indexO: 0,
                ))));
  }

  Widget build(BuildContext context) {
    return Placeholder(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: TextLiquidFill(
            text: 'CheckOut',
            waveDuration: const Duration(seconds: 15),
            waveColor: Colors.cyanAccent,
            boxBackgroundColor: Colors.white,
            textStyle: const TextStyle(
              fontFamily: 'Lobster',
              fontSize: 40.0,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
            boxHeight: 100.0,
          ),
          backgroundColor: Colors.white,
          elevation: 0.0,
          actions: const [
            Icon(
              Icons.shopping_cart_outlined,
              color: Colors.black,
            )
          ],
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Text("Thank you !",
                style: Theme.of(context).textTheme.subtitle1!.copyWith(
                    fontFamily: 'Lobster',
                    fontSize: 40,
                    fontWeight: FontWeight.bold)),
            const SizedBox(
              height: 100,
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('your order hes been placed ! you will',
                      style: Theme.of(context).textTheme.subtitle1!.copyWith(
                          fontFamily: 'Lobster',
                          fontSize: 23,
                          fontWeight: FontWeight.normal)),
                  Text('recieve an email with details',
                      style: Theme.of(context).textTheme.subtitle1!.copyWith(
                          fontFamily: 'Lobster',
                          fontSize: 23,
                          fontWeight: FontWeight.normal)),
                  Lottie.asset('assets/animation/congratulation.json',
                      height: 300),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
