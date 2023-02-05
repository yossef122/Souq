import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:souq/Shared/Components/Components.dart';
import 'package:souq/presentation_UI/Modules/finalCheckOut2.dart';

class FinalCheckoutScreen extends StatelessWidget {
  FinalCheckoutScreen({Key? key}) : super(key: key);
  var formkey = GlobalKey<FormState>();
  var deliveryController = TextEditingController();
  var cityController = TextEditingController();
  var phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Placeholder(
      child: Scaffold(
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
                    "ADDRESS",
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
                                padding:
                                    paddingBuilder(start: 15, top: 40, end: 15),
                                child: Text(
                                  "Delivery",
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
                                padding:
                                    paddingBuilder(start: 15, top: 15, end: 15),
                                child: Container(
                                  height: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.grey[200],
                                  ),
                                  child: TextFormField(
                                    controller: deliveryController,
                                    validator: (String? va) {
                                      if (va!.isEmpty) {
                                        return '   Delivery mustn\'t empty';
                                      }
                                      return null;
                                    },
                                    style: const TextStyle(color: Colors.black),
                                    decoration: const InputDecoration(
                                      prefix: SizedBox(
                                        width: 10,
                                      ),
                                      alignLabelWithHint: true,
                                      hintText: '12345 forest road',
                                      labelStyle: TextStyle(
                                          fontSize: 18, color: Colors.white),
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: paddingBuilder(
                                      start: 15, top: 20, end: 15),
                                  child: Text(
                                    "City",
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
                                      start: 15, top: 15, bottom: 15, end: 15),
                                  child: Container(
                                    height: 50,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Colors.grey[200],
                                    ),
                                    child: TextFormField(
                                      controller: cityController,
                                      validator: (String? va) {
                                        if (va!.isEmpty) {
                                          return '   City mustn\'t empty';
                                        }
                                        return null;
                                      },
                                      style:
                                          const TextStyle(color: Colors.black),
                                      decoration: const InputDecoration(
                                        prefix: SizedBox(
                                          width: 10,
                                        ),
                                        alignLabelWithHint: true,
                                        hintText: 'Alexandria',
                                        labelStyle: TextStyle(
                                            fontSize: 18, color: Colors.white),
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    paddingBuilder(start: 15, top: 20, end: 15),
                                child: Text(
                                  "Phone",
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
                                    start: 15, top: 15, bottom: 15, end: 15),
                                child: Container(
                                  height: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.grey[200],
                                  ),
                                  child: TextFormField(
                                    validator: (String? va) {
                                      if (va!.isEmpty) {
                                        return ' Phone mustn\'t empty';
                                      }
                                      return null;
                                    },
                                    keyboardType: TextInputType.number,
                                    controller: phoneController,
                                    style: const TextStyle(color: Colors.black),
                                    decoration: const InputDecoration(
                                      prefix: SizedBox(
                                        width: 10,
                                      ),
                                      alignLabelWithHint: true,
                                      hintText: '0112310825',
                                      labelStyle: TextStyle(
                                          fontSize: 18, color: Colors.white),
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                              ),
                            ],
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
                                    navigatorBuilder(
                                        context, FinalCheckOutScreen2());
                                  }
                                },
                                child: const Text(
                                  'Payment',
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
      ),
    );
  }
}
