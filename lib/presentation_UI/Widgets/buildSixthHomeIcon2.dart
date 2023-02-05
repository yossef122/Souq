import 'package:flutter/material.dart';

class buildSixthHomeIcon2 extends StatelessWidget {
  String image;
  BoxFit? fit;
  String? textUnderEveryPhoto;
  var function;
  var index;
  var context;
  buildSixthHomeIcon2(this.image, this.fit,this.index,this.context, {this.textUnderEveryPhoto,this.function});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function,
      child: Container(
        height: 240,
        width: 150,
        color: Colors.grey[200],
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Colors.white,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsetsDirectional.only(start: 20, end: 20),
                child: Container(
                    height: 130,
                    child: Image(
                      image: NetworkImage(image),
                      height: 70,
                      width: 100,
                      fit: fit,
                    )),
              ),
            ),
            /*Padding(
              padding: const EdgeInsetsDirectional.only(start: 5, end: 5),
              child: Center(
                child: Text(
                  maxLines :1,

                  textUnderEveryPhoto!,
                  overflow: TextOverflow.visible,
                  style:

                  const TextStyle(fontWeight: FontWeight.bold, height: 2,),
                ),
              ),
            ),*/
          ],
        ),
      ),
    );
  }
}
