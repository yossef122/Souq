import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:souq/Bussiness_logic_layer/cubit/SouqCubit.dart';
import 'package:souq/Bussiness_logic_layer/cubit/SouqStates.dart';
import 'package:souq/Data_layer/Models/ProductModel.dart';

import 'package:souq/Shared/Components/Components.dart';
import 'package:souq/Shared/Components/Constants.dart';
import 'package:souq/presentation_UI/Modules/SellScreen/SellScreen.dart';
import 'package:souq/presentation_UI/Widgets/ShoppingMore.dart';

class ShoppingMoreScreen extends StatelessWidget {
  List<ProductModel>? list;

  ShoppingMoreScreen({
    this.list,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<Souq_cubit, Souq_states>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: Column(
            children: [
              Container(
                color: Colors.cyanAccent,
                child: Padding(
                  padding: const EdgeInsetsDirectional.only(
                      start: 15, end: 15, top: 40, bottom: 14),
                  child: Container(
                    height: 40,
                    width: double.infinity,
                    clipBehavior: Clip.antiAlias,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadiusDirectional.all(
                          Radius.circular(8),
                        ),
                        color: Colors.white),
                    child: TextFormField(
                      maxLines: 1,
                      decoration: const InputDecoration(
                          hintText: 'Search Souq.eg ',
                          suffixIcon: Icon(Icons.search),
                          border: OutlineInputBorder()),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: isorder == true
                          ? CrossAxisAlignment.start
                          : CrossAxisAlignment.center,
                      children: [
                        isorder == true
                            ? Padding(
                                padding: paddingBuilder(top: 10, start: 20),
                                child: Text('Your Orders',
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle1!
                                        .copyWith(
                                            fontFamily: 'Lobster',
                                            fontSize: 20,
                                            fontWeight: FontWeight.normal)),
                              )
                            : Container(),
                        ListView.separated(
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) => ShoppingMore(
                            list![index].image,
                            list![index].name,
                            list![index].price,
                            offerprice: list![index].offerprice,
                            offer: list![index].offer,
                            numberOfStars: list![index].numberOfStars,
                            function: () {
                              Souq_cubit.get(context).changeIndex2(index);
                              navigatorBuilder(
                                  context,
                                  SellProducrtScreen(
                                    nameOfProduct: list![index2].name,
                                    numberOfStars: list![index2].numberOfStars,
                                    price: list![index2].price,
                                    offerprice: list![index2].offerprice,
                                    offer: list![index2].offer,
                                    image: list![index2].image,
                                    model: list!,
                                  ));
                            },
                          ),
                          separatorBuilder: (context, index) => Container(
                            height: 5,
                          ),
                          itemCount: /*list==null?8 :*/ list!.length,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
