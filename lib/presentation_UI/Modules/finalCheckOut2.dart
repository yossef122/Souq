import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:souq/Bussiness_logic_layer/cubit/SouqCubit.dart';
import 'package:souq/Bussiness_logic_layer/cubit/SouqStates.dart';

import 'package:souq/Shared/Components/Components.dart';
import 'package:souq/presentation_UI/Modules/FinalCheckOutScreen3.dart';

class FinalCheckOutScreen2 extends StatelessWidget {
  FinalCheckOutScreen2({Key? key}) : super(key: key);
  var formkey = GlobalKey<FormState>();
  var CardNumberController = TextEditingController();
  var DateController = TextEditingController();
  var SecureController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Placeholder(
      child: BlocConsumer<Souq_cubit, Souq_states>(
        listener: (BuildContext context, state) {
          if (state is DeleteallordersSuccessState) {
            navigatorBuilder(context, const FinalCheckOutScreen3());
          }
        },
        builder: (BuildContext context, Object? state) {
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: TextLiquidFill(
                text: 'CheckOut',
                waveDuration: const Duration(seconds: 20),
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
            body: Form(
              key: formkey,
              child: Container(
                color: Colors.white,
                child: Padding(
                  padding: paddingBuilder(top: 70),
                  child: Column(
                    children: [
                      Center(
                          child: Text(
                        "Payment",
                        style: Theme.of(context).textTheme.subtitle1!.copyWith(
                            fontFamily: 'Lobster',
                            fontSize: 30,
                            fontWeight: FontWeight.normal),
                      )),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: paddingBuilder(
                                        start: 15, top: 40, end: 15),
                                    child: Text(
                                      "Card number",
                                      style: Theme.of(context)
                                          .textTheme
                                          .subtitle1!
                                          .copyWith(
                                              fontFamily: 'Lobster',
                                              fontSize: 20,
                                              fontWeight: FontWeight.normal),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: paddingBuilder(
                                        start: 15, top: 15, end: 15),
                                    child: Container(
                                      height: 50,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Colors.grey[200],
                                      ),
                                      child: TextFormField(
                                        keyboardType: TextInputType.number,
                                        controller: CardNumberController,
                                        validator: (String? va) {
                                          if (va!.isEmpty) {
                                            return '   Card number mustn\'t empty';
                                          }
                                          return null;
                                        },
                                        style: const TextStyle(
                                            color: Colors.black),
                                        decoration: InputDecoration(
                                          prefix: const SizedBox(
                                            width: 10,
                                          ),
                                          alignLabelWithHint: true,
                                          prefixIcon: const Icon(
                                              Icons.credit_card_outlined),
                                          hintText: '...........',
                                          suffixText: '6665',
                                          labelStyle: const TextStyle(
                                              fontSize: 40,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                          border: InputBorder.none,
                                          suffixStyle: Theme.of(context)
                                              .textTheme
                                              .subtitle1!
                                              .copyWith(
                                                  fontFamily: 'Lobster',
                                                  fontSize: 20,
                                                  fontWeight:
                                                      FontWeight.normal),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: paddingBuilder(
                                        start: 15, top: 20, end: 15),
                                    child: Text(
                                      "Expiration Date",
                                      style: Theme.of(context)
                                          .textTheme
                                          .subtitle1!
                                          .copyWith(
                                              fontFamily: 'Lobster',
                                              fontSize: 20,
                                              fontWeight: FontWeight.normal),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: paddingBuilder(
                                        start: 15,
                                        top: 15,
                                        bottom: 15,
                                        end: 15),
                                    child: Container(
                                      height: 50,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Colors.grey[200],
                                      ),
                                      child: TextFormField(
                                        keyboardType: TextInputType.datetime,
                                        controller: DateController,
                                        validator: (String? va) {
                                          if (va!.isEmpty) {
                                            return '   Date mustn\'t empty';
                                          }
                                          return null;
                                        },
                                        style: const TextStyle(
                                            color: Colors.black),
                                        decoration: const InputDecoration(
                                          prefix: SizedBox(
                                            width: 10,
                                          ),
                                          alignLabelWithHint: true,
                                          hintText: 'MM/YY',
                                          labelStyle: TextStyle(
                                              fontSize: 18,
                                              color: Colors.white),
                                          border: InputBorder.none,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: paddingBuilder(
                                        start: 15, top: 20, end: 15),
                                    child: Text(
                                      "Secure Code",
                                      style: Theme.of(context)
                                          .textTheme
                                          .subtitle1!
                                          .copyWith(
                                              fontFamily: 'Lobster',
                                              fontSize: 20,
                                              fontWeight: FontWeight.normal),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: paddingBuilder(
                                        start: 15,
                                        top: 15,
                                        bottom: 15,
                                        end: 15),
                                    child: Container(
                                      height: 50,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Colors.grey[200],
                                      ),
                                      child: TextFormField(
                                        validator: (String? va) {
                                          if (va!.isEmpty) {
                                            return ' Secure Code mustn\'t empty';
                                          }
                                          return null;
                                        },
                                        keyboardType: TextInputType.number,
                                        controller: SecureController,
                                        style: const TextStyle(
                                            color: Colors.black),
                                        decoration: const InputDecoration(
                                          prefix: SizedBox(
                                            width: 10,
                                          ),
                                          alignLabelWithHint: true,
                                          hintText: '01/02',
                                          labelStyle: TextStyle(
                                              fontSize: 18,
                                              color: Colors.white),
                                          border: InputBorder.none,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: paddingBuilder(start: 20),
                                child: Row(
                                  children: [
                                    Text('Total : ',
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle1!
                                            .copyWith(
                                                fontFamily: 'Lobster',
                                                fontSize: 20,
                                                fontWeight: FontWeight.normal)),
                                    Text(
                                        '${Souq_cubit.get(context).orderSalary}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle1!
                                            .copyWith(
                                                fontFamily: 'Lobster',
                                                fontSize: 20,
                                                fontWeight: FontWeight.normal)),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 50,
                              ),
                              Padding(
                                padding: paddingBuilder(bottom: 40),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(17),
                                    color: Colors.cyanAccent,
                                  ),
                                  child: MaterialButton(
                                    onPressed: () {
                                      if (formkey.currentState!.validate()) {
                                        Souq_cubit.get(context).Deleteorders();
                                      }
                                    },
                                    child: const Text(
                                      'PlaceOrder',
                                      style: TextStyle(
                                          // fontFamily: 'Lobster',
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
