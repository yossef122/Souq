import 'package:auth_buttons/auth_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:souq/Bussiness_logic_layer/login_cubit/login_States.dart';
import 'package:souq/Bussiness_logic_layer/login_cubit/login_cubit.dart';
import 'package:souq/Data_layer/Network/CasheHelper/CasheHelper.dart';
import 'package:souq/Shared/Components/Components.dart';
import 'package:souq/presentation_UI/Layout_Screen/LayOut_Screen.dart';
import 'package:souq/presentation_UI/Modules/Register_Screen/RegisterScreen.dart';
import 'package:souq/presentation_UI/Modules/SignOrLoginScreen/SignOrLoginScreen.dart';


class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  var formkey = GlobalKey<FormState>();
  var EmailController = TextEditingController();
  var PassWordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => login_cubit(),
      child: BlocConsumer<login_cubit, login_states>(
        listener: (context, state) {
          if (state is loginSuccessState) {
            CasheHelper.Savedata(key: 'Uid', value: state.uid.toString())
                .then((value) {
              // navigatorBuilder(context, LayOut_Screen());
              navigatorBuilderAndfinish(
                  context,
                  LayOut_Screen(
                    indexO: 0,
                  ));
              // Souq_cubit.get(context).GetFavourite();
            });
            print(state.uid);
            showToast(message: 'login Success', state: ToastColorState.success);
          } else if (state is loginerrorState) {
            showToast(message: 'Login Error', state: ToastColorState.error);
          }
        },
        builder: (context, state) {
          var cubit = login_cubit.get(context);
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                onPressed: () {
                  navigatorBuilder(context, const SignOrLogin_Screen());
                },
                icon: const Icon(Icons.arrow_back),
              ),
              title: const Image(
                image:
                    AssetImage('assets/images/Untitled-removebg-preview.png'),
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
                        children: [
                          const Text(
                            'Login !',
                            style: TextStyle(
                                fontFamily: 'Lobster',
                                fontSize: 45,
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
                                          return '   Email mustn\'t empty';
                                        }
                                        return null;
                                      },
                                      style: const TextStyle(color: Colors.white),
                                      controller: EmailController,
                                      cursorColor: Colors.white,
                                      decoration: const InputDecoration(
                                        prefixIcon: Icon(Icons.email_outlined,
                                            color: Colors.white),
                                        labelText: 'Email',
                                        hintText: 'Enter Your Email',
                                        labelStyle: TextStyle(
                                            fontSize: 18, color: Colors.white),
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
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: TextFormField(
                                      style: const TextStyle(color: Colors.white),
                                      keyboardType:
                                          TextInputType.visiblePassword,
                                      obscureText: true,
                                      validator: (String? va) {
                                        if (va!.isEmpty) {
                                          return '   Password mustn\'t empty';
                                        }
                                        return null;
                                      },
                                      controller: PassWordController,
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
                                            fontSize: 18, color: Colors.white),
                                        border: InputBorder.none,
                                        fillColor: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                state is! loginLoadingState
                                    ? Padding(
                                        padding: paddingBuilder(
                                            start: 20, end: 20, top: 20),
                                        child: Container(
                                          width: 200,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: Colors.blue,
                                          ),
                                          child: MaterialButton(
                                            onPressed: () {
                                              if (formkey.currentState!
                                                  .validate()) {
                                                cubit.UserLogin(
                                                    email: EmailController.text
                                                        .toString(),
                                                    password: PassWordController
                                                        .text);
                                              }
                                            },
                                            child: const Text(
                                              'Login',
                                              style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.white,
                                                fontFamily: 'Lobster',
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                    : const Center(
                                        child: CircularProgressIndicator()),
                                Container(
                                  child: Padding(
                                    padding:
                                        paddingBuilder(start: 100, top: 20),
                                    child: Row(
                                      children: [
                                        GoogleAuthButton(
                                          onPressed: () {
                                            login_cubit
                                                .get(context)
                                                .signInWithGoogle();
                                          },
                                          style: const AuthButtonStyle(
                                            buttonType: AuthButtonType.icon,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        FacebookAuthButton(
                                          onPressed: () {
                                            // login_cubit.get(context).signInWithGoogle();
                                          },
                                          style: const AuthButtonStyle(
                                            buttonType: AuthButtonType.icon,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: paddingBuilder(
                                      start: 50, end: 15, top: 15),
                                  child: Container(
                                    child: Row(
                                      children: [
                                        const Text('Are you new To Souq?',
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontFamily: 'Lobster',
                                                color: Colors.white)),
                                        TextButton(
                                            onPressed: () {
                                              navigatorBuilder(
                                                  context, Register_Screen());
                                            },
                                            child: const Text(
                                              'Register',
                                              style: TextStyle(
                                                fontSize: 20,
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          'Copyrights',
                                          style: Theme.of(context)
                                              .textTheme
                                              .caption!
                                              .copyWith(
                                              fontFamily: 'Lobster',

                                              color: Colors.white,
                                                  fontSize: 13),
                                        ),
                                        const Icon(
                                          Icons.copyright,
                                          size: 13,
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
                                                    fontSize: 13)),
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
          );
        },
      ),
    );
  }
}

// login_cubit.get(context).signInWithGoogle();
