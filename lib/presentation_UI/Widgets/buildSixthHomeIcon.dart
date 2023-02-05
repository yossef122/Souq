import 'package:flutter/material.dart';

class buildSixthHomeIcon extends StatelessWidget {
  String image;
  BoxFit? fit;
  var function;

  buildSixthHomeIcon(this.image, this.fit, {this.function});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function,
      child: Container(
        height: 190,
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
                      image: AssetImage(image),
                      height: 70,
                      width: 100,
                      fit: fit,
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
