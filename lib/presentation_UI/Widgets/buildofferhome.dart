import 'package:flutter/material.dart';
import 'package:souq/Bussiness_logic_layer/cubit/SouqCubit.dart';
import 'package:souq/Data_layer/Models/ProductModel.dart';
import 'package:souq/Shared/Components/Components.dart';
import 'package:souq/Shared/Components/Constants.dart';
import 'package:souq/presentation_UI/Modules/SellScreen/SellScreen.dart';
import 'package:souq/presentation_UI/Modules/ShoppingMoreScreen/ShoppingMoreScreen.dart';
import 'package:souq/presentation_UI/Widgets/buildofferIcon.dart';


class buildofferhome extends StatelessWidget {
  List<ProductModel> model;
  var context;
  buildofferhome(this.model,this.context);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 288,
      width: double.infinity,
      color: Colors.grey[200],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsetsDirectional.only(start: 10, end: 10),
            child: Text(
              'Today\'s offer',
              style: TextStyle(
                  fontFamily: 'Lobster',

                  fontWeight: FontWeight.normal,
                  fontSize: 20),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsetsDirectional.only(start: 7, end: 10),
              child: Container(
                height: 150,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) =>
////////////////////////////////////////////////////////////////////////////////////////////////////
                    buildofferIcon(model[index].image, model[index].offer,
                        function: () {
                          Souq_cubit.get(context).changeIndex2(index);

                          navigatorBuilder(
                              context,
                              SellProducrtScreen(
                                nameOfProduct: model[index2].name,
                                numberOfStars: model[index2].numberOfStars,
                                price: model[index2].price,
                                offerprice: model[index2].offerprice,
                                offer: model[index2].offer,
                                image: model[index2].image,
                                model: model,
                              ));
                        }),
                    separatorBuilder: (context, index) => const SizedBox(
                      width: 12,
                    ),
                    itemCount: 8),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(start: 7, end: 10),
            child: TextButton(
                onPressed: () {
                  navigatorBuilder(context, ShoppingMoreScreen(list: model));
                },
                child: const Text('for more offers',style: TextStyle(                                        fontFamily: 'Lobster',
                fontSize: 17

                ),)),
          )
        ],
      ),
    );
  }
}
