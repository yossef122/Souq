import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:souq/Bussiness_logic_layer/cubit/SouqCubit.dart';
import 'package:souq/Bussiness_logic_layer/cubit/SouqStates.dart';
import 'package:souq/Shared/Components/Components.dart';
import 'package:souq/Shared/Components/Constants.dart';
import 'package:souq/presentation_UI/Modules/Home_Screen/Home_Screen.dart';
import 'package:souq/presentation_UI/Modules/LoginScreen/Login.dart';
import 'package:souq/presentation_UI/Modules/Register_Screen/RegisterScreen.dart';
import 'package:souq/presentation_UI/Modules/ShoppingMoreScreen/ShoppingMoreScreen.dart';
import 'package:souq/presentation_UI/Widgets/SearchWidget.dart';
import 'package:souq/presentation_UI/Widgets/ShoppingMore.dart';
import 'package:souq/presentation_UI/Widgets/buildproductslist.dart';

class ShoopingCard_Screen extends StatelessWidget {
  const ShoopingCard_Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = Souq_cubit.get(context).orders;

    return BlocConsumer<Souq_cubit, Souq_states>(
      listener: (context, state) {
        if (state == SetordersProductUserSuccessState) {
          Souq_cubit.get(context).Getorders();
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Column(
            children: [
              const SearchWidget(),
              Expanded(
                child: Container(
                  child: Uid == ''
                      ? SingleChildScrollView(
                          child: Column(
                            children: [
                              Column(
                                children: [
                                  ChooseLocation(),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  Build1imageWithText(
                                      'assets/images/CarShopping-transformed.png',
                                      CrossAxisAlignment.start),
                                  const Text(
                                    'Your Shopping car is empty',
                                    style: TextStyle(
                                      fontSize: 25,
                                      fontFamily: 'Lobster',
                                    ),
                                  ),
                                  TextButton(
                                      onPressed: () {
                                        navigatorBuilder(
                                            context, Home_Screen());
                                      },
                                      child: const Text(
                                        'see offer of today',
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontFamily: 'Lobster',
                                        ),
                                      )),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.only(
                                        start: 20, end: 20, top: 30),
                                    child: Container(
                                      width: double.infinity,
                                      height: 50,
                                      decoration: const BoxDecoration(
                                          borderRadius:
                                              BorderRadiusDirectional.all(
                                            Radius.circular(8),
                                          ),
                                          color: Colors.yellow),
                                      child: OutlinedButton(
                                        // color: Colors.white,
                                        onPressed: () {
                                          navigatorBuilder(
                                              context, LoginScreen());
                                        },
                                        child: const Text(
                                          'Log in to your email',
                                          style: TextStyle(
                                              fontFamily: 'Lobster',
                                              fontSize: 20,
                                              fontWeight: FontWeight.normal,
                                              color: Colors.black),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.only(
                                        start: 20, end: 20, top: 15),
                                    child: Container(
                                      width: double.infinity,
                                      height: 50,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              const BorderRadiusDirectional.all(
                                            Radius.circular(8),
                                          ),
                                          color: Colors.grey[200]),
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
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Container(
                                    height: 50,
                                    width: double.infinity,
                                    color: Colors.grey[200],
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.only(
                                        start: 20, end: 20, top: 20),
                                    child: Container(
                                      width: double.infinity,
                                      height: 50,
                                      decoration: const BoxDecoration(
                                          borderRadius:
                                              BorderRadiusDirectional.all(
                                            Radius.circular(8),
                                          ),
                                          color: Colors.yellow),
                                      child: OutlinedButton(
                                        // color: Colors.white,
                                        onPressed: () {},
                                        child: const Text(
                                          'Continue Shopping',
                                          style: TextStyle(
                                              fontFamily: 'Lobster',
                                              fontSize: 20,
                                              fontWeight: FontWeight.normal,
                                              color: Colors.black),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 50,
                                    width: double.infinity,
                                    // color: Colors.grey[300],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      : SingleChildScrollView(
                          child: Column(
                            children: [
                              ChooseLocation(),
                              const SizedBox(
                                height: 30,
                              ),
                              Souq_cubit.get(context).IsEmpty2 == true
                                  ? Padding(
                                      padding:
                                          paddingBuilder(start: 20, top: 10),
                                      child: Row(
                                        children: [
                                          Build1imageWithText(
                                              'assets/images/CarShopping-transformed.png',
                                              CrossAxisAlignment.start,
                                              radius: 50,
                                              height: 150),
                                          const SizedBox(
                                            width: 25,
                                          ),
                                          Column(
                                            children: [
                                              const Text(
                                                'Your Shopping car is empty',
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  fontFamily: 'Lobster',
                                                ),
                                              ),
                                              TextButton(
                                                  onPressed: () {
                                                    navigatorBuilder(
                                                        context,
                                                        ShoppingMoreScreen(
                                                            list: Souq_cubit
                                                                    .get(
                                                                        context)
                                                                .OfferList));

                                                    /*navigatorBuilder(
                                                  context, LayOut_Screen(indexO: 0,));*/
                                                  },
                                                  child: const Text(
                                                      'see offer of today')),
                                              const SizedBox(
                                                height: 25,
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    )
                                  : Padding(
                                      padding:
                                          paddingBuilder(start: 20, top: 20),
                                      child: Container(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text('Orders',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .subtitle1!
                                                    .copyWith(
                                                        fontFamily: 'Lobster',
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.normal)),
                                            ShoppingMore(cubit[0].image,
                                                cubit[0].name, cubit[0].price,
                                                offerprice: cubit[0].offerprice,
                                                offer: cubit[0].offer,
                                                Isfavourite: true,
                                                context: context,
                                                Index: 0,
                                                numberOfStars:
                                                    cubit[0].numberOfStars,
                                                function: () {
                                              Souq_cubit.get(context)
                                                  .changeindexorder(0);
                                              Souq_cubit.get(context)
                                                  .changeIndex2(index);
                                              navigatorBuilder(
                                                  context,
                                                  buildproductslist(cubit,
                                                      // Isfav: true,
                                                      context: context));
                                            }),
                                            Padding(
                                              padding:
                                                  const EdgeInsetsDirectional
                                                      .only(start: 10, end: 10),
                                              child: TextButton(
                                                  onPressed: () {
                                                    navigatorBuilder(
                                                        context,
                                                        ShoppingMoreScreen(
                                                            list: cubit));
                                                    Souq_cubit.get(context)
                                                        .ISorder(true);
                                                  },
                                                  child: const Text(
                                                    'Shopping More !',
                                                    style: TextStyle(
                                                        fontFamily: 'Lobster',
                                                        fontSize: 17),
                                                  )),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                              Container(
                                height: 15,
                                width: double.infinity,
                                color: Colors.grey[300],
                              ),
                              Container(
                                color: Colors.grey[300],
                                child: Padding(
                                  padding: paddingBuilder(start: 15, end: 15),
                                  child: Column(
                                    children: [
                                      Card(
                                        elevation: 20,
                                        color: Colors.white,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding:
                                                  paddingBuilder(start: 20),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                      'Frequently repurchased in',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .subtitle1!
                                                          .copyWith(
                                                              fontFamily:
                                                                  'Lobster',
                                                              fontSize: 20,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal)),
                                                  Text('Phones',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .subtitle1!
                                                          .copyWith(
                                                              fontFamily:
                                                                  'Lobster',
                                                              fontSize: 20,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal)),
                                                ],
                                              ),
                                            ),
                                            Container(
                                                height: 345,
                                                width: double.infinity,
                                                child: ListView.separated(
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    itemBuilder: (context,
                                                            index) =>
                                                        itemWithNameScroll2(
                                                            context,
                                                            Souq_cubit.get(
                                                                    context)
                                                                .PhonesList,
                                                            index),
                                                    separatorBuilder:
                                                        (context, index) =>
                                                            Container(
                                                              height: 1,
                                                            ),
                                                    itemCount:
                                                        Souq_cubit.get(context)
                                                            .PhonesList
                                                            .length)),
                                          ],
                                        ),
                                      ),
                                      Card(
                                        elevation: 20,
                                        color: Colors.white,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding:
                                                  paddingBuilder(start: 20),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                      'Frequently repurchased in',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .subtitle1!
                                                          .copyWith(
                                                              fontSize: 20,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal)),
                                                  Text('Clothes',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .subtitle1!
                                                          .copyWith(
                                                              fontSize: 20,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal)),
                                                ],
                                              ),
                                            ),
                                            Container(
                                                height: 360,
                                                width: double.infinity,
                                                child: ListView.separated(
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    itemBuilder: (context,
                                                            index) =>
                                                        itemWithNameScroll2(
                                                            context,
                                                            Souq_cubit.get(
                                                                    context)
                                                                .trouserList,
                                                            index),
                                                    separatorBuilder:
                                                        (context, index) =>
                                                            Container(
                                                              height: 1,
                                                            ),
                                                    itemCount:
                                                        Souq_cubit.get(context)
                                                            .trouserList
                                                            .length)),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.only(
                                    start: 20, end: 20, top: 20),
                                child: Container(
                                  width: double.infinity,
                                  height: 50,
                                  decoration: const BoxDecoration(
                                      borderRadius: BorderRadiusDirectional.all(
                                        Radius.circular(8),
                                      ),
                                      color: Colors.yellowAccent),
                                  child: OutlinedButton(
                                    // color: Colors.white,
                                    onPressed: () {},
                                    child: const Text(
                                      'Continue Shopping',
                                      style: TextStyle(
                                          fontSize: 22,
                                          fontFamily: 'Lobster',
                                          fontWeight: FontWeight.normal,
                                          color: Colors.black),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 25,
                              )
                            ],
                          ),
                        ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget Build1imageWithText(
          String image, CrossAxisAlignment crossAxisAlignment,
          {double? height, double? radius}) =>
      Container(
        height: height ?? 230,
        child: Column(
          crossAxisAlignment: crossAxisAlignment,
          children: [
            Center(
                child: Container(
              child: CircleAvatar(
                  radius: radius ?? 100,
                  backgroundColor: Colors.white,
                  child: Lottie.asset('assets/animation/noPurchases.json')),
            ))
            // )
          ],
        ),
      );
}
