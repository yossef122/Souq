import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:souq/Bussiness_logic_layer/cubit/SouqCubit.dart';
import 'package:souq/Data_layer/Models/ProductModel.dart';
import 'package:souq/Shared/Components/Constants.dart';
import 'package:souq/presentation_UI/Modules/SellScreen/SellScreen.dart';
import 'package:souq/presentation_UI/Widgets/itemWithNameScroll.dart';




navigatorBuilder(context, Widget page) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => page));

navigatorBuilderAndfinish(context, Widget page) => Navigator.pushReplacement(
    context, MaterialPageRoute(builder: (context) => page));

EdgeInsetsDirectional paddingBuilder({
  double start = 0.0,
  double end = 0.0,
  double top = 0.0,
  double bottom = 0.0,
}) {
  return EdgeInsetsDirectional.only(
      start: start, end: end, top: top, bottom: bottom);
}

Widget itemWithNameScroll2(context, List<ProductModel> model, index) => InkWell(
      onTap: () {
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
      },
      child: Container(
          color: Colors.white,
          height: 400,
          width: 200,
          child: Padding(
            padding: const EdgeInsetsDirectional.only(start: 30, end: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    height: 200,
                    width: 200,
                    child: Image(
                      image: NetworkImage('${model[index].image}'),
                      height: 170,
                      width: 170,
                    )),
                Container(
                  height: 50,
                  child: Text(
                    '${model[index].name}',
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1!
                        .copyWith(fontSize: 15, color: Colors.cyan),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(
                  height: 3,
                ),
                Text(
                  '${model[index].price} Egp',
                  style: Theme.of(context).textTheme.subtitle1!.copyWith(
                      fontFamily: 'Lobster',
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(17),
                    color: Colors.yellowAccent,
                  ),
                  child: MaterialButton(
                    onPressed: () {
                      Souq_cubit.get(context).changeIndex2(index);

                      Souq_cubit.get(context).ordersInDataBase(
                        image: model[index].image,
                        numberOfStars: model[index].numberOfStars,
                        price: model[index].price,
                        offerprice: model[index].offerprice,
                        offer: model[index].offer,
                        name: model[index].name,

                      );
                    },
                    child: const Text(
                      'Add To Card',
                      style: TextStyle(
                        fontFamily: 'Lobster',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )),
    );

Widget itemSearch(String image, String text,
        {List<ProductModel>? list, function}) =>
    InkWell(
      onTap: function,
      child: Padding(
        padding: paddingBuilder(start: 10, end: 10, top: 10, bottom: 10),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                    // color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(10)),
                height: 160,
                width: 170,
                child:
                    Image(height: 160, width: 120, image: NetworkImage(image)),
              ),
              Container(
                width: 15,
                color: Colors.grey,
                // height: double.infinity,
              ),
              Center(
                child: Text(
                  text,
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
              ),
            ],
          ),
        ),
      ),
    );

Widget ChooseLocation() => InkWell(
      onTap: () {
// Navigator.push(context, MaterialPageRoute(builder: (context)=>Splash_Screen()));
      },
      child: Container(
        height: 35,
// color: Colors.cyanAccent[100],
        decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: GragientColor,
          /*begin: Alignment.topCenter,
          end: Alignment.bottomCenter,*/
          begin: Alignment.topRight,
          end: Alignment.topLeft,
        )),
        child: Padding(
          padding: const EdgeInsetsDirectional.only(start: 15, end: 15),
          child: Row(
            children: const [
              Icon(Icons.location_on_outlined),
              Text(
                'please choose your destination location',
                style: TextStyle(fontFamily: 'Lobster', fontSize: 20),
              )
            ],
          ),
        ),
      ),
    );

void showToast({
  required message,
  required ToastColorState state,
}) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
      backgroundColor: toastColor(state),
      textColor: Colors.white,
      fontSize: 16.0);
}

enum ToastColorState { success, error, warning }

Color toastColor(
  ToastColorState state,
) {
  Color color;
  switch (state) {
    case ToastColorState.success:
      color = Colors.green;
      break;

    case ToastColorState.error:
      color = Colors.red;
      break;
    case ToastColorState.warning:
      color = Colors.yellow;
      break;
  }
  return color;
}


Widget Build() => Container(
    height: 360,
    width: double.infinity,
    child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => itemWithNameScroll(/*context*/),
        separatorBuilder: (context, index) => Container(
              height: 1,
            ),
        itemCount: 10));

Widget HomeSeperator({double? Height}) => Container(
      height: Height ?? 10,
      width: double.infinity,
      color: Colors.grey[400],
    );
/*
enum Butto {
  Email,
  Google,
  GoogleDark,
  Facebook,
  FacebookNew,
  GitHub,
  LinkedIn,
  Pinterest,
  Tumblr,
  Twitter
}*/
Gradient gradientbuild(List<Color> list,
        {AlignmentGeometry? begin, AlignmentGeometry? end}) =>
    LinearGradient(
      colors: list,
      begin: begin ?? Alignment.topCenter,
      end: end ?? Alignment.bottomCenter,
    );
