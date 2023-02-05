import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:souq/Bussiness_logic_layer/cubit/SouqCubit.dart';
import 'package:souq/Bussiness_logic_layer/login_cubit/login_States.dart';
import 'package:souq/Bussiness_logic_layer/login_cubit/login_cubit.dart';
import 'package:souq/Data_layer/Network/CasheHelper/CasheHelper.dart';

import 'package:souq/Shared/Components/Components.dart';
import 'package:souq/Shared/Components/Constants.dart';
import 'package:souq/presentation_UI/Modules/SignOrLoginScreen/SignOrLoginScreen.dart';
import 'package:souq/presentation_UI/Widgets/SearchWidget.dart';

class Setting_Screen extends StatelessWidget {
  const Setting_Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => login_cubit(),
      child: BlocConsumer<login_cubit, login_states>(
        listener: (context, state) {
          if (state is SignOutSuccessState) {
            CasheHelper.Savedata(key: 'Uid', value: '').then((value) {
              // Uid=null;
              navigatorBuilderAndfinish(context, const SignOrLogin_Screen());
            });
          }
        },
        builder: (context, state) => Scaffold(
          body: Stack(
            children: [
              Container(
                  // color: Colors.cyanAccent,
                  decoration: BoxDecoration(
                      gradient: gradientbuild(GragientColor,
                          begin: Alignment.centerRight,
                          end: Alignment.centerLeft)),
                  child: Column(
                    children: [
                      const SearchWidget(),
                      const SizedBox(
                        height: 10,
                      ),
                      Expanded(
                        child: GridView.count(
                          crossAxisCount: 2,
                          mainAxisSpacing: 1,
                          crossAxisSpacing: 1,
                          childAspectRatio: 1 / 1.2,
                          children: List.generate(
                            Souq_cubit.get(context).OfferList.length,
                            (index) => BuildContainerOfPhotoWithText('offers',
                                Souq_cubit.get(context).OfferList[index].image),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 60,
                      ),
                    ],
                  )),
            ],
          ),
          bottomSheet: Container(
            color: Colors.white,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.only(start: 10, end: 5),
                  child: OutlinedButton(
                    onPressed: () {},
                    child: const Text(
                      /*'Lists'*/
                      'القوائم',
                      style:
                          TextStyle(fontFamily: 'Lobster', color: Colors.black),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.only(start: 10, end: 5),
                  child: OutlinedButton(
                    onPressed: () {},
                    child: const Text(
                        /*'Buy again*/
                        'شراء مره اخري',
                        style: TextStyle(
                            fontFamily: 'Lobster', color: Colors.black)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.only(start: 10, end: 5),
                  child: OutlinedButton(
                    onPressed: () {},
                    child: const Text(
                        /*'Your Purchases'*/
                        'مشترياتك',
                        style: TextStyle(
                            fontFamily: 'Lobster', color: Colors.black)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.only(start: 10, end: 2),
                  child: OutlinedButton(
                    onPressed: () {
                      login_cubit.get(context).SignOut(email: '', password: '');
                    },
                    child: const Text(
                        /*'Your account'*/
                        'SignOut',
                        style: TextStyle(
                            fontFamily: 'Lobster', color: Colors.black)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget BuildContainerOfPhotoWithText(String? text, String? image) => Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Stack(
            alignment: Alignment.topLeft,
            children: [
              Container(
                width: 150,
                height: 200,
                color: Colors.white,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  '$text',
                  style: const TextStyle(
                      fontFamily: 'Lobster',
                      fontSize: 25,
                      fontWeight: FontWeight.normal),
                ),
              ),
            ],
          ),
          Image(
            image: NetworkImage(/*'assets/images/speakers.png'*/ '$image'),
            height: 150,
            width: 150,
          ),
        ],
      );
}
