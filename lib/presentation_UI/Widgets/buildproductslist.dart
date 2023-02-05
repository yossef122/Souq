import 'package:flutter/material.dart';
import 'package:souq/Bussiness_logic_layer/cubit/SouqCubit.dart';
import 'package:souq/Data_layer/Models/ProductModel.dart';

import 'package:souq/Shared/Components/Components.dart';
import 'package:souq/Shared/Components/Constants.dart';
import 'package:souq/presentation_UI/Modules/SellScreen/SellScreen.dart';
import 'package:souq/presentation_UI/Widgets/ShoppingMore.dart';

class buildproductslist extends StatelessWidget {
  List<ProductModel> list;
  bool? Isfav;
  bool? Isorder;
  var context;

  buildproductslist(this.list, {this.Isorder,this.Isfav, this.context});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) =>
          // list !=null?
          ShoppingMore(
              list[index].image,
              list[index].name,
              list[index].price,
              offerprice: list[index].offerprice,
              offer: list[index].offer,
              Isfavourite: Isfav ?? Isorder ,
              context: context,
              Index: index,
              isorder: Isfav ==true ? false:true,
              numberOfStars: list[index].numberOfStars,
              function: () {
        // Isfav==true?
        Souq_cubit.get(context).changeindexfav(index); /*:*/
        Souq_cubit.get(context).changeIndex2(index);
        navigatorBuilder(
            context,
            SellProducrtScreen(
              nameOfProduct: list[index2].name,
              numberOfStars: list[index2].numberOfStars,
              price: list[index2].price,
              offerprice: list[index2].offerprice,
              offer: list[index2].offer,
              image: list[index2].image,
              model: list,
            ));
      }),
      separatorBuilder: (context, index) => Container(
        height: 5,
      ),
      itemCount: list.length,
    );
  }
}
