import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:souq/Bussiness_logic_layer/cubit/SouqCubit.dart';
import 'package:souq/Bussiness_logic_layer/cubit/SouqStates.dart';

import 'package:souq/Shared/Components/Components.dart';
import 'package:souq/Shared/Components/Constants.dart';
import 'package:souq/presentation_UI/Modules/FinalCheckout.dart';
import 'package:souq/presentation_UI/Widgets/buildproductslist.dart';

class BuyOrder extends StatelessWidget {
  const BuyOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<Souq_cubit, Souq_states>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: paddingBuilder(top: 40, start: 20),
                    child: Text('Your Shopping Card',
                        style: Theme.of(context).textTheme.subtitle1!.copyWith(
                            fontFamily: 'Lobster',
                            fontSize: 20,
                            fontWeight: FontWeight.normal)),
                  ),
                  Uid != ''
                      ? Column(
                          children: [
                            Container(
                              child: Padding(
                                padding: const EdgeInsetsDirectional.only(
                                    start: 2, end: 2),
                                child: Souq_cubit.get(context).IsEmpty != true
                                    ? buildproductslist(
                                        Souq_cubit.get(context).orders,
                                        Isorder: true,
                                        context: context)
                                    : Column(
                                        children: [
                                          Column(
                                            children: const [
                                              SizedBox(
                                                  height: 100,
                                                  width: double.infinity,
                                                  child: Center(
                                                      child: Text(
                                                    'No Favourite item for You',
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        fontFamily: 'Lobster',
                                                        color: Colors.black),
                                                  ))),
                                              Center(
                                                  child:
                                                      CircularProgressIndicator())
                                            ],
                                          ),
                                        ],
                                      ),
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Container(
                              color: Colors.grey[400],
                              height: 1,
                              width: 400,
                            ),
                            const SizedBox(
                              height: 40,
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
                                  Text('${Souq_cubit.get(context).orderSalary}',
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
                              height: 8,
                            ),
                            Center(
                              child: Container(
                                height: 40,
                                width: 140,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(17),
                                  color: Colors.yellowAccent,
                                ),
                                child: Row(
                                  children: [
                                    MaterialButton(
                                      onPressed: () {
                                        navigatorBuilder(
                                            context, FinalCheckoutScreen());
                                      },
                                      child: const Text(
                                        'Buy',
                                        style: TextStyle(
                                          fontFamily: 'Lobster',
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    const Icon(Icons.arrow_forward_ios_outlined)
                                  ],
                                ),
                              ),
                            )
                          ],
                        )
                      : Container()
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
