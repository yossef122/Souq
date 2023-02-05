import 'package:flutter/material.dart';
import 'package:souq/Bussiness_logic_layer/cubit/SouqCubit.dart';
import 'package:souq/Data_layer/Models/ProductModel.dart';

import 'package:souq/Shared/Components/Components.dart';
import 'package:souq/Shared/Components/Constants.dart';
import 'package:souq/presentation_UI/Modules/SellScreen/SellScreen.dart';
import 'package:souq/presentation_UI/Modules/ShoppingMoreScreen/ShoppingMoreScreen.dart';
import 'package:souq/presentation_UI/Widgets/buildSixthHomeIcon2.dart';

class build9ImageWithText2 extends StatelessWidget {
  String text;
  List<ProductModel> model;
  var context;
  var function;
  var index1;
  CrossAxisAlignment crossAxisAlignment;
  BoxFit? fit;

  build9ImageWithText2(this.model, this.text,
      this.crossAxisAlignment,this.fit, this.context,
      {this.function,this.index1});


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Souq_cubit.get(context).changeIndex2(index);
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
      },
      child: Container(
        color: Colors.white,
        height: 550,
        // width: ,
        child: Column(
          crossAxisAlignment: crossAxisAlignment,
          children: [
            Padding(
              padding:
              const EdgeInsetsDirectional.only(start: 10, end: 10, top: 20),
              child: Text(
                ' ${text}',
                style:
                const TextStyle(
                    fontFamily: 'Lobster',

                    fontSize: 25, fontWeight: FontWeight.normal),
              ),
            ),
            Container(
              height: 440,
              child: Padding(
                padding: const EdgeInsetsDirectional.only(end: 10),
                child: GridView.count(
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 3,
                  shrinkWrap: false,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 1 / 1.1,
                  children: List.generate(9, (index) {
                    // Souq_cubit.get(context).changeIndex2(index) ;
                    // Souq_cubit.get(context).changeIndex(index) ;

                    return buildSixthHomeIcon2(
                        "${model[index].image}", fit, index, context,/*textUnderEveryPhoto: model[index].name,*/
                        function: () {
                          // Souq_cubit.get(context).changeIndex2(index);
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
                        });
                  }),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 10, end: 10),
              child: TextButton(
                  onPressed: () {
                    navigatorBuilder(context, ShoppingMoreScreen(list: model));
                  },
                  child: const Text(
                    'Shopping More !',
                    style: TextStyle(
                      fontFamily: 'Lobster',
                      fontSize:17,
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
