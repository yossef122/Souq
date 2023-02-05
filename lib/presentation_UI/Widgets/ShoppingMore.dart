import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:souq/Bussiness_logic_layer/cubit/SouqCubit.dart';
import 'package:souq/Shared/Components/Components.dart';
import 'package:souq/Shared/Components/Constants.dart';

class ShoppingMore extends StatelessWidget {
  String? image;
  String? nameofitem;
  String? price;
  String? offerprice;
  String? offer;
  var function;
  String? numberOfStars;
  bool? Isfavourite;
  var context;
  var Index;
  var isorder;
  ShoppingMore(this.image, this.nameofitem, this. price,
      {
        this.isorder,
        this. offerprice,
        this. offer,
        this.function,
        this. numberOfStars,
        this.Isfavourite,
        this.context,
        this.Index});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function,
      child: Padding(
        padding: paddingBuilder(start: 10, end: 10, top: 10, bottom: 10),
        child: Container(
          height: 185,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: Row(
            children: [
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        // color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10)),
                    height: 160,
                    width: 160,
                    child: Image(
                      height: 160,
                      width: 120,
                      image: NetworkImage('$image'),
                      // color: Colors.white30,
                    ),
                  ),
                  offer != null
                      ? Container(
                          height: 20,
                          color: Colors.red,
                          child: Text(
                            'Offer $offer%',
                            style: const TextStyle(color: Colors.black),
                          ),
                        )
                      : Container(),
                ],
              ),
              const SizedBox(
                width: 15,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 3,
                    ),
                    const Text(
                      'Sponsored',
                      style: TextStyle(color: Colors.blue),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      '$nameofitem',
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          overflow: TextOverflow.clip),
                      maxLines: 3,
                      // overflow: TextOverflow.visible,
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.only(top: 10, end: 15),
                      child: RatingBar.builder(
                        ignoreGestures: true,
                        initialRating: double.parse(numberOfStars!),
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        unratedColor: Colors.amber.withAlpha(50),
                        itemCount: 5,
                        itemSize: 20.0,
                        itemPadding:
                            const EdgeInsets.symmetric(horizontal: 0.0),
                        itemBuilder: (context, k) => Icon(
                          selectedIcon ?? Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {},
                        updateOnDrag: true,
                      ),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        Text(
                          '$price',
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Lobster',
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              decoration: offerprice != null
                                  ? TextDecoration.lineThrough
                                  : null),
                        ),
                        offerprice == null
                            ? const Text(
                                ' Egp',
                                style: TextStyle(
                                  fontFamily: 'Lobster',
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            : const Text(''),
                        const SizedBox(
                          width: 20,
                        ),
                        offerprice != null
                            ? Text(
                                '$offerprice Egp',
                                style: const TextStyle(
                                    fontFamily: 'Lobster',

                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              )
                            : const Text(''),
                        const Spacer(),
                        Isfavourite == true
                            ? Padding(
                                padding: paddingBuilder(bottom: 5),
                                child: Container(
                                  height: 15,
                                  child: Padding(
                                    padding: paddingBuilder(end: 10),
                                    child: IconButton(
                                        onPressed: () {
                                          Souq_cubit.get(context)
                                              .changeindexfav(Index); /*:*/
                                          if(isorder==false)
                                          Souq_cubit.get(context)
                                              .DeleteFavouriteItem(indexfav);
                                        else
                                            Souq_cubit.get(context)
                                                .DeleteordersItem(indexorder);

                                        },
                                        icon: const Icon(
                                          Icons.delete_forever,
                                          size: 25,
                                        )),
                                  ),
                                ),
                              )
                            : Container()
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
