import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:souq/Bussiness_logic_layer/Register_cubit/Register_States.dart';
import 'package:souq/Bussiness_logic_layer/Register_cubit/Register_cubit.dart';
import 'package:souq/Data_layer/Network/CasheHelper/CasheHelper.dart';

import 'package:souq/Shared/Components/Components.dart';
import 'package:souq/Shared/Components/Constants.dart';
import 'package:souq/presentation_UI/Layout_Screen/LayOut_Screen.dart';
import 'package:souq/presentation_UI/Modules/LoginScreen/Login.dart';
import 'package:souq/presentation_UI/Modules/SignOrLoginScreen/SignOrLoginScreen.dart';

class Register_Screen extends StatelessWidget {
  Register_Screen({Key? key}) : super(key: key);
  var NameController = TextEditingController();
  var EmailControllerOfNewAccount = TextEditingController();
  var PassWordControllerOfNewAccount = TextEditingController();
  var formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => Register_cubit(),
      child: BlocConsumer<Register_cubit, RegisterState>(
        listener: (context, state) {
          if (state is RegisterSuccessState) {
            CasheHelper.Savedata(key: 'Uid', value: state.uid.toString())
                .then((value) {
              // navigatorBuilder(context, LayOut_Screen());
              navigatorBuilderAndfinish(context, LayOut_Screen());
              // Souq_cubit.get(context).GetFavourite();
            });
            print(state);
            showToast(
                message: 'Register Success', state: ToastColorState.success);
          } else if (state is RegisterErrorState) {
            showToast(message: 'Register Error', state: ToastColorState.error);
          }
        },
        builder: (context, state) => Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                navigatorBuilder(context, const SignOrLogin_Screen());
              },
              icon: const Icon(Icons.arrow_back),
            ),
            title: const Image(
              image: AssetImage('assets/images/Untitled-removebg-preview.png'),
              height: 90,
              width: 90,
              color: Colors.white,
            ),
            centerTitle: true,
            backgroundColor: Colors.black,
            elevation: 1,
          ),
          body: Form(
            key: formkey,
            child: Container(
              color: Colors.black,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    color: Colors.grey[200],
                    height: 1,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: paddingBuilder(start: 35),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Resgister !',
                          style: TextStyle(
                              fontFamily: 'Lobster',
                              fontSize: 35,
                              color: Colors.white),
                          maxLines: 2,
                        ),
                        // Text('You can Login From Here',style: TextStyle(fontSize: 27,color: Colors.white),maxLines: 2,),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: paddingBuilder(start: 20, end: 50, top: 70),
                      child: Container(
                        height: double.infinity,
                        color: Colors.black,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Padding(
                                padding: paddingBuilder(
                                    start: 15, top: 15, bottom: 15),
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.black,
                                      border: Border.all(
                                          width: 1, color: Colors.white)),
                                  child: TextFormField(
                                    validator: (String? va) {
                                      if (va!.isEmpty) {
                                        return 'UserName mustn\'t empty';
                                      }
                                      return null;
                                    },
                                    style: const TextStyle(
                                        fontFamily: 'Lobster',
                                        color: Colors.white),
                                    controller: NameController,
                                    cursorColor: Colors.white,
                                    decoration: const InputDecoration(
                                      prefixIcon: Icon(Icons.email_outlined,
                                          color: Colors.white),
                                      labelText: 'UserName',
                                      labelStyle: TextStyle(
                                          fontFamily: 'Lobster',
                                          fontSize: 18,
                                          color: Colors.white),
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: paddingBuilder(
                                    start: 15, top: 15, bottom: 15),
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.black,
                                      border: Border.all(
                                          width: 1, color: Colors.white)),
                                  child: TextFormField(
                                    validator: (String? va) {
                                      if (va!.isEmpty) {
                                        return 'Email mustn\'t empty';
                                      }
                                      return null;
                                    },
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Lobster',
                                    ),
                                    controller: EmailControllerOfNewAccount,
                                    cursorColor: Colors.white,
                                    decoration: const InputDecoration(
                                      prefixIcon: Icon(Icons.email_outlined,
                                          color: Colors.white),
                                      labelText: 'Email',
                                      hintText: 'Enter Your Email',
                                      labelStyle: TextStyle(
                                          fontFamily: 'Lobster',
                                          fontSize: 18,
                                          color: Colors.white),
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: paddingBuilder(start: 15, top: 15),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.black,
                                      border: Border.all(
                                          width: 1, color: Colors.white),
                                      borderRadius: BorderRadius.circular(20)),
                                  child: TextFormField(
                                    validator: (String? va) {
                                      if (va!.isEmpty) {
                                        return 'Password mustn\'t empty';
                                      }
                                      return null;
                                    },
                                    style: const TextStyle(color: Colors.white),
                                    controller: PassWordControllerOfNewAccount,
                                    keyboardType: TextInputType.visiblePassword,
                                    obscureText: true,
                                    decoration: InputDecoration(
                                      prefixIcon: const Icon(
                                        Icons.password_outlined,
                                        color: Colors.white,
                                      ),
                                      suffixIcon: IconButton(
                                        icon: const Icon(
                                            Icons.remove_red_eye_outlined,
                                            color: Colors.white),
                                        onPressed: () {},
                                      ),
                                      labelText: 'Password',
                                      hintText: 'Enter Your password',
                                      labelStyle: const TextStyle(
                                          fontFamily: 'Lobster',
                                          fontSize: 18,
                                          color: Colors.white),
                                      border: InputBorder.none,
                                      fillColor: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    paddingBuilder(start: 15, end: 15, top: 15),
                                child: Container(
                                  width: 200,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(40),
                                    color: Colors.blue,
                                  ),
                                  child: MaterialButton(
                                    onPressed: () {
                                      if (formkey.currentState!.validate()) {
                                        Register_cubit.get(context).UserRegister(
                                            email: EmailControllerOfNewAccount
                                                .text,
                                            password:
                                                PassWordControllerOfNewAccount
                                                    .text,
                                            Phone: '011',
                                            name: NameController.text,
                                            Country: SelectedItem ?? 'Egypt');
                                      }
                                    },
                                    child: const Text(
                                      'Register',
                                      style: TextStyle(
                                        fontFamily: 'Lobster',
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    paddingBuilder(start: 50, end: 15, top: 15),
                                child: Container(
                                  child: Row(
                                    children: [
                                      const Text('Are you Alrady user at Souq?',
                                          style: TextStyle(
                                              fontFamily: 'Lobster',
                                              fontSize: 15,
                                              color: Colors.white)),
                                      TextButton(
                                          onPressed: () {
                                            navigatorBuilder(
                                                context, LoginScreen());
                                          },
                                          child: const Text(
                                            'Login',
                                            style: TextStyle(
                                              fontFamily: 'Lobster',
                                            ),
                                          ))
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                height: 100,
                                color: Colors.black,
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.only(
                                      start: 1, end: 1),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        'Copyrights',
                                        style: Theme.of(context)
                                            .textTheme
                                            .caption!
                                            .copyWith(
                                                fontFamily: 'Lobster',
                                                color: Colors.white,
                                                fontSize: 11.3),
                                      ),
                                      const Icon(
                                        Icons.copyright,
                                        size: 11.3,
                                        color: Colors.white,
                                      ),
                                      Text(
                                          'for year 2021-2022 is preserved for souq company',
                                          style: Theme.of(context)
                                              .textTheme
                                              .caption!
                                              .copyWith(
                                                  fontFamily: 'Lobster',
                                                  color: Colors.white,
                                                  fontSize: 11.3)),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
