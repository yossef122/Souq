import 'package:flutter/material.dart';
import 'package:souq/Bussiness_logic_layer/cubit/SouqCubit.dart';
import 'package:souq/Data_layer/Models/ProductModel.dart';

import 'package:souq/Shared/Components/Components.dart';
import 'package:souq/Shared/Components/Constants.dart';
import 'package:souq/presentation_UI/Modules/SellScreen/SellScreen.dart';
import 'package:souq/presentation_UI/Modules/ShoppingMoreScreen/ShoppingMoreScreen.dart';
import 'package:souq/presentation_UI/Widgets/buildFifthHomeIcon2.dart';

class build4ImageWithText2 extends StatelessWidget {
  String mainText;
  String textUnderEveryPhoto;
  List<ProductModel> model;
  var context;
  CrossAxisAlignment crossAxisAlignment;
  BoxFit? fit;

  build4ImageWithText2(this.mainText, this.model, this.textUnderEveryPhoto,
      this.crossAxisAlignment, this.fit, this.context);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 510,
      // width: ,
      child: Column(
        crossAxisAlignment: crossAxisAlignment,
        children: [
          Padding(
            padding:
                const EdgeInsetsDirectional.only(start: 10, end: 10, top: 20),
            child: Text(
              mainText,
              style: const TextStyle(
                  fontFamily: 'Lobster',
                  fontWeight: FontWeight.normal,
                  fontSize: 25),
            ),
          ),
          Container(
            height: 410,
            child: Padding(
              padding: const EdgeInsetsDirectional.only(start: 10, end: 10),
              child: GridView.count(
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                shrinkWrap: false,
                mainAxisSpacing: 5,
                crossAxisSpacing: 5,
                childAspectRatio: 1.3 / 1.5,
                //

                children: List.generate(
                    4,
                    (index) => buildFifthHomeIcon2(
                            textUnderEveryPhoto,
                        model[index].image!,
                        fit,
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
                        })),
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
                  style: TextStyle(fontFamily: 'Lobster', fontSize: 17),
                )),
          )
        ],
      ),
    );
  }
}
