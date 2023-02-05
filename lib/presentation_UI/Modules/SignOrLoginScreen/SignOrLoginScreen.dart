import 'package:flutter/material.dart';
import 'package:souq/Shared/Components/Components.dart';
import 'package:souq/Shared/Components/Constants.dart';
import 'package:souq/presentation_UI/Layout_Screen/LayOut_Screen.dart';
import 'package:souq/presentation_UI/Modules/LoginScreen/Login.dart';
import 'package:souq/presentation_UI/Modules/Register_Screen/RegisterScreen.dart';

class SignOrLogin_Screen extends StatelessWidget {
  const SignOrLogin_Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: gradientbuild(
          [
            Colors.white,
            Colors.cyanAccent,
            // Colors.cyan,
          ],
          begin: Alignment.topCenter,
        )),
        child: Padding(
          padding: paddingBuilder(top: 80),
          child: Container(
            // color: Colors.grey[200],

            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                Center(
                  child: Container(
                      child: const Image(
                    image: AssetImage(
                        'assets/images/Untitled-removebg-preview.png'),
                  )),
                ),
                const SizedBox(
                  height: 40,
                ),
                const Text(
                  'Sign in to your account',
                  style: TextStyle(
                      fontFamily: 'Lobster',
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: Colors.white),
                ),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'View Your Wish List',
                      style: TextStyle(
                          fontFamily: 'Lobster',
                          fontSize: 20,
                          color: Colors.white),
                    ),
                    Text(
                      'Find & reorder past purrchases',
                      style: TextStyle(
                          fontFamily: 'Lobster',
                          fontSize: 20,
                          color: Colors.white),
                    ),
                    Text(
                      'Track your purchasses',
                      style: TextStyle(
                          fontFamily: 'Lobster',
                          fontSize: 20,
                          color: Colors.white),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.only(start: 14, end: 14),
                  child: SizedBox(
                    height: 40,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        // Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginAndRegisterScreen()));
                        navigatorBuilder(context, LoginScreen());
                        loginOrRegister = 2;
                      },
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              Colors.yellowAccent[900])),
                      child: const Center(
                        child: Text(
                          'Already a Customer? Sign in',
                          style: TextStyle(
                              fontFamily: 'Lobster', color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.only(start: 14, end: 14),
                  child: Container(
                    height: 40,
                    width: double.infinity,
                    color: Colors.black,
                    child: TextButton(
                      onPressed: () {
                        navigatorBuilder(context, Register_Screen());
                        loginOrRegister = 1;
                      },
                      child: const Center(
                        child: Text(
                          'New to Souq.eg ? Create an account',
                          style: TextStyle(
                              fontFamily: 'Lobster', color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.only(start: 14, end: 14),
                  child: Container(
                    height: 40,
                    width: double.infinity,
                    color: Colors.black,
                    child: TextButton(
                      onPressed: () {
                        navigatorBuilder(context, LayOut_Screen());
                      },
                      child: const Center(
                          child: Text('Skip Sign in',
                              style: TextStyle(
                                  fontFamily: 'Lobster', color: Colors.white))),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
