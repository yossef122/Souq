// ignore_for_file: sized_box_for_whitespace, sort_child_properties_last, must_be_immutable, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:souq/Bussiness_logic_layer/cubit/SouqCubit.dart';
import 'package:souq/Bussiness_logic_layer/cubit/SouqStates.dart';
import 'package:souq/Data_layer/Models/ProductModel.dart';

import 'package:souq/Shared/Components/Components.dart';
import 'package:souq/Shared/Components/Constants.dart';
import 'package:souq/presentation_UI/Modules/BuyOrderScreen/BuyOrderScreen.dart';
import 'package:souq/presentation_UI/Widgets/SearchWidget.dart';

class SellProducrtScreen extends /*StatefulWidget*/ StatelessWidget {
  String? image;
  String? nameOfProduct;
  String? price;
  String? offer;
  String? offerprice;
  String? numberOfStars;
  List<ProductModel>? model;

  SellProducrtScreen(
      {Key? key,
      this.image,
      this.nameOfProduct,
      this.price,
      this.offer,
      this.offerprice,
      this.numberOfStars,
      this.model})
      : super(key: key);

  double initialRating = 0.5;

  IconData? selectedIcon;

  var pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<Souq_cubit, Souq_states>(
      listener: (context, state) {
        if (state is ChangeIndex2State) {
          NumberOfOrder = 1;
          Souq_cubit.get(context).ChangeNubmerOfOrder(1);
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Column(
            children: [
              const SearchWidget(),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Column(
                        children: [
                          Container(
                            height: 55,
                            color: Colors.blue,
                            child: Padding(
                              padding: const EdgeInsetsDirectional.only(
                                  start: 15, end: 15),
                              child: Row(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: const [
                                      SizedBox(
                                        height: 6,
                                      ),
                                      Text(
                                        'Shopping and save your Money',
                                        style: TextStyle(
                                            fontSize: 17,
                                            fontFamily: 'Lobster',
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text('and play games with premium',
                                          style: TextStyle(
                                              fontSize: 17,
                                              fontFamily: 'Lobster',
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                  Spacer(),
                                  const Image(
                                      image: AssetImage(
                                          'assets/images/GameingIcon.png')),
                                ],
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              TextButton(
                                  onPressed: () {},
                                  child: const Text(
                                    'Trading mark:Samsung',
                                    style: TextStyle(
                                        fontFamily: 'Lobster', fontSize: 15),
                                  )),
                              const Spacer(),
                              Padding(
                                padding: const EdgeInsetsDirectional.only(
                                    top: 10, end: 15),
                                child: RatingBar.builder(
                                  ignoreGestures: true,
                                  initialRating: double.parse(numberOfStars!),
                                  minRating: 1,
                                  direction: Axis.horizontal,
                                  allowHalfRating: true,
                                  unratedColor: Colors.amber.withAlpha(50),
                                  itemCount: 5,
                                  itemSize: 20.0,
                                  itemPadding: const EdgeInsets.symmetric(
                                      horizontal: 0.0),
                                  itemBuilder: (context, k) => Icon(
                                    selectedIcon ?? Icons.star,
                                    color: Colors.amber,
                                  ),
                                  onRatingUpdate: (rating) {},
                                  updateOnDrag: true,
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.only(
                                start: 10, end: 10),
                            child: Container(
                              height: 75,
                              child: Text(
                                '$nameOfProduct',
                                style: const TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.only(
                                start: 20, end: 20),
                            child: Stack(
                              alignment: Alignment.bottomRight,
                              children: [
                                Stack(
                                  children: [
                                    Container(
                                      height: 300,
                                      child: Image(
                                        image: NetworkImage(image!),
                                      ),
                                    ),
                                    const CircleAvatar(
                                      child: Icon(Icons.share),
                                      radius: 20,
                                      backgroundColor: Colors.white,
                                    )
                                  ],
                                ),
                                CircleAvatar(
                                  child: IconButton(
                                    icon: const Icon(Icons.favorite_border),
                                    onPressed: () {
                                      Souq_cubit.get(context)
                                          .FavouriteInDataBase(
                                        name: nameOfProduct,
                                        image: image,
                                        price: price,
                                        numberOfStars: numberOfStars,
                                        offerprice: offerprice,
                                        offer: offer,
                                      );
                                    },
                                  ),
                                  radius: 20,
                                  backgroundColor: Colors.white,
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              NumberOfOrder > 1
                                  ? IconButton(
                                      onPressed: () {
                                        Souq_cubit.get(context)
                                            .ChangeNubmerOfOrder(
                                                NumberOfOrder--);
                                      },
                                      icon: const Icon(Icons.minimize,
                                          color: Colors.blue))
                                  : Padding(
                                      padding:
                                          paddingBuilder(start: 15, end: 20),
                                      child: const Icon(Icons.minimize,
                                          size: 24, color: Colors.grey),
                                    ),
                              Padding(
                                padding: paddingBuilder(start: 10, end: 10),
                                child: Text(
                                  '$NumberOfOrder ',
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle1!
                                      .copyWith(
                                          fontFamily: 'Lobster',
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                ),
                              ),
                              NumberOfOrder < 5
                                  ? IconButton(
                                      onPressed: () {
                                        Souq_cubit.get(context)
                                            .ChangeNubmerOfOrder(
                                                NumberOfOrder++);
                                      },
                                      icon: const Icon(
                                        Icons.add,
                                        color: Colors.blue,
                                      ))
                                  : Padding(
                                      padding:
                                          paddingBuilder(start: 20, end: 20),
                                      child: const Icon(Icons.add,
                                          size: 24, color: Colors.grey),
                                    ),
                              Text(
                                '${NumberOfOrder * int.parse(price!)} Egp',
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1!
                                    .copyWith(
                                        fontFamily: 'Lobster',
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.only(
                                start: 20, end: 20),
                            child: Container(
                              height: 40,
                              width: double.infinity,
                              // ignore: sort_child_properties_last
                              child: OutlinedButton(
                                  onPressed: () {
                                    if (Uid != '') {
                                      Souq_cubit.get(context).ordersInDataBase(
                                        name: nameOfProduct,
                                        image: image,
                                        price: price,
                                        numberOfStars: numberOfStars,
                                      );
                                      Souq_cubit.get(context).Getorders();
                                      navigatorBuilder(context, BuyOrder());
                                    }
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: const [
                                      Text(
                                        'See all buying options',
                                        style: TextStyle(
                                            fontFamily: 'Lobster',
                                            fontSize: 15,
                                            color: Colors.black),
                                      ),
                                      SizedBox(
                                        width: 146,
                                      ),
                                      Icon(
                                        Icons.arrow_forward_ios_outlined,
                                        color: Colors.black,
                                      )
                                    ],
                                  )),
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadiusDirectional.circular(50),
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                paddingBuilder(start: 20, end: 20, top: 10),
                            child: Container(
                              width: double.infinity,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextButton(
                                      onPressed: () {
                                        Souq_cubit.get(context)
                                            .ordersInDataBase(
                                          name: nameOfProduct,
                                          image: image,
                                          price: price,
                                          numberOfStars: numberOfStars,
                                        );
                                      },
                                      child: const Text(
                                        'add to the list',
                                        style: TextStyle(
                                          fontFamily: 'Lobster',
                                        ),
                                      )),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: 10,
                        width: double.infinity,
                        color: Colors.grey[300],
                      ),
                      Padding(
                        padding: paddingBuilder(start: 20, end: 20, top: 20),
                        child: Row(
                          children: [
                            Column(
                              children: [
                                CircleAvatar(
                                  radius: 15,
                                  child: const Image(
                                    image: NetworkImage(
                                        'https://m.media-amazon.com/images/G/42/A2I-Convert/mobile/IconFarm/icon-cod-struck._CB403797073_.png'),
                                  ),
                                  backgroundColor: Colors.grey[200],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text(
                                  'doesn\'t support',
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.blueAccent),
                                ),
                                const Text(
                                  'pay when',
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.blueAccent),
                                ),
                                const Text(
                                  'receiving',
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.blueAccent),
                                )
                              ],
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Column(
                              children: [
                                CircleAvatar(
                                  radius: 15,
                                  child: const Image(
                                    image: NetworkImage(
                                        'https://m.media-amazon.com/images/G/42/A2I-Convert/mobile/IconFarm/icon-secure-transaction._CB414468582_.png'),
                                  ),
                                  backgroundColor: Colors.grey[200],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text(
                                  'it\'s safe',
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.blueAccent),
                                ),
                                const Text(
                                  'don\'t worry',
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.blueAccent),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                        height: 7,
                        width: double.infinity,
                        color: Colors.grey[300],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: paddingBuilder(start: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Users whose see this product ',
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle1!
                                        .copyWith(
                                            fontFamily: 'Lobster',
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold)),
                                Text(', they also see those ',
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle1!
                                        .copyWith(
                                            fontFamily: 'Lobster',
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
                          Container(
                              height: 360,
                              width: double.infinity,
                              child: ListView.separated(
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) =>
                                      itemWithNameScroll2(
                                          context, model!, index),
                                  separatorBuilder: (context, index) =>
                                      Container(
                                        height: 1,
                                      ),
                                  itemCount: model!.length)),
                          Container(
                            height: 10,
                            width: double.infinity,
                            color: Colors.grey[300],
                          ),
                        ],
                      ),
                    ],
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
