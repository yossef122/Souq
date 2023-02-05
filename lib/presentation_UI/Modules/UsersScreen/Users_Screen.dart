// ignore_for_file: sort_child_properties_last, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:souq/Bussiness_logic_layer/cubit/SouqCubit.dart';
import 'package:souq/Bussiness_logic_layer/cubit/SouqStates.dart';

import 'package:souq/Shared/Components/Components.dart';
import 'package:souq/Shared/Components/Constants.dart';
import 'package:souq/presentation_UI/Modules/LoginScreen/Login.dart';
import 'package:souq/presentation_UI/Modules/Register_Screen/RegisterScreen.dart';
import 'package:souq/presentation_UI/Widgets/buildproductslist.dart';

class Users_Screen extends StatelessWidget {
  const Users_Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<Souq_cubit, Souq_states>(
        listener: (context, state) {},
        builder: (context, state) => Container(
              child: Scaffold(
                body: Column(
                  children: [
                    Container(
                      // color: Colors.cyanAccent,
                      decoration: BoxDecoration(
                        gradient: gradientbuild(GragientColor,
                            end: Alignment.topCenter,
                            begin: Alignment.topRight),
                      ),
                      height: 100,
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsetsDirectional.only(
                                start: 30, end: 10, top: 20),
                            child: Image(
                              image: AssetImage(
                                  'assets/images/Untitled-removebg-preview.png'),
                              height: 65,
                              color: Colors.white,
                            ),
                          ),
                          const Spacer(),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.notifications_none,
                                size: 35,
                              )),
                          const SizedBox(
                            width: 10,
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.search, size: 35)),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  gradient: gradientbuild(GragientColor,
                                      end: Alignment.bottomCenter,
                                      begin: Alignment.bottomRight),
                                ),

                                // color: Colors.cyanAccent[200],
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.only(
                                      start: 20, end: 20, top: 30),
                                  child: Uid == ''
                                      ? Column(
                                          children: const [
                                            Text(
                                              'يرجي تسجيل الدخول',
                                              style: TextStyle(
                                                  fontFamily: 'Lobster',
                                                  fontSize: 22,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              'للحصول علي التجربة',
                                              style: TextStyle(
                                                  height: 2,
                                                  fontSize: 22,
                                                  fontFamily: 'Lobster',
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Center(
                                              child: Text('الافضل',
                                                  style: TextStyle(
                                                      fontFamily: 'Lobster',
                                                      fontSize: 22,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            )
                                          ],
                                        )
                                      : Container(
                                          height: 100,
                                          child: const Center(
                                            child: Text('Favourite Item',
                                                style: TextStyle(
                                                    fontFamily: 'Lobster',
                                                    fontSize: 22,
                                                    fontWeight:
                                                        FontWeight.normal)),
                                          ),
                                        ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.only(
                                    start: 20, end: 20, top: 20),
                                child: Uid == ''
                                    ? Container(
                                        width: double.infinity,
                                        height: 50,
                                        child: OutlinedButton(
                                          // color: Colors.white,
                                          onPressed: () {
                                            navigatorBuilder(
                                                context, LoginScreen());
                                          },
                                          child: const Text(
                                            'Log in',
                                            style: TextStyle(
                                                fontFamily: 'Lobster',
                                                fontSize: 20,
                                                fontWeight: FontWeight.normal,
                                                color: Colors.black),
                                          ),
                                        ),
                                        decoration: const BoxDecoration(
                                            borderRadius:
                                                BorderRadiusDirectional.all(
                                              Radius.circular(8),
                                            ),
                                            color: Colors.yellow),
                                      )
                                    : null,
                              ),
                              Uid != ''
                                  ? Container(
                                      child: Padding(
                                        padding:
                                            const EdgeInsetsDirectional.only(
                                                start: 2, end: 2),
                                        child: /*Uid != null &&*/
                                            // ignore: unnecessary_null_comparison
                                            Souq_cubit.get(context).IsEmpty !=
                                                    true
                                                ? buildproductslist(
                                                    Souq_cubit.get(context)
                                                        .Favourite,
                                                    Isfav: true,
                                                    context: context)
                                                : Column(
                                                    children: [
                                                      Column(
                                                        children: [
                                                          Container(
                                                              height: 100,
                                                              width: double
                                                                  .infinity,
                                                              child:
                                                                  const Center(
                                                                      child:
                                                                          Text(
                                                                'No Favourite item for You',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        20,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                    fontFamily:
                                                                        'Lobster',
                                                                    color: Colors
                                                                        .black),
                                                              ))),
                                                          Center(
                                                              child:
                                                                  CircularProgressIndicator())
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                      ),
                                    )
                                  : Container(),
                              Padding(
                                padding: const EdgeInsetsDirectional.only(
                                    start: 20, end: 20, top: 15),
                                child: Uid == ''
                                    ? Container(
                                        width: double.infinity,
                                        height: 50,
                                        child: OutlinedButton(
                                          onPressed: () {
                                            navigatorBuilder(
                                                context, Register_Screen());
                                          },
                                          child: const Text(
                                            'create anew account',
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontFamily: 'Lobster',
                                                fontWeight: FontWeight.normal,
                                                color: Colors.black),
                                          ),
                                        ),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                const BorderRadiusDirectional
                                                    .all(
                                              Radius.circular(8),
                                            ),
                                            color: Colors.grey[200]),
                                      )
                                    : null,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Uid == ''
                                  ? Column(
                                      children: [
                                        unLoginIconsWithText(
                                            'assets/images/Box-transformed.png',
                                            'Check oreder\'s status and follow',
                                            'your order or replace it '),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        unLoginIconsWithText(
                                            'assets/images/shopping Woman.jpg',
                                            'See your last purchses',
                                            'your daily necessities'),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        unLoginIconsWithText(
                                            'assets/images/List8-transformed.png',
                                            'Make Your LIst with your purchses',
                                            'Which you want now or later'),
                                      ],
                                    )
                                  : Column(),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ));
  }

  Widget unLoginIconsWithText(
          String image, String? FirstText, String? SecongText) =>
      Container(
        height: 120,
        child: Row(
          children: [
            Image(
              image: AssetImage(
                '${image}',
              ),
              height: 120,
              width: 100,
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${FirstText}',
                    style: const TextStyle(
                        fontFamily: 'Lobster',
                        fontSize: 20.5,
                        fontWeight: FontWeight.normal),
                  ),
                  Text(
                    '${SecongText} ',
                    style: const TextStyle(
                        fontFamily: 'Lobster',
                        fontSize: 20.5,
                        fontWeight: FontWeight.normal),
                  ),
                ],
              ),
            )
          ],
        ),
      );
}
