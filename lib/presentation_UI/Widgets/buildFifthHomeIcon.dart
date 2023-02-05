import 'package:flutter/material.dart';

class buildFifthHomeIcon extends StatelessWidget {
String text; String image; BoxFit? fit; var function;
buildFifthHomeIcon (this.text, this.image, this.fit, {this.function});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function,
      child: Container(
        height: 190,
        width: 150,
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              // color: Colors.grey,

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
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 5, end: 5),
              child: Center(
                child: Text(
                  text,
                  style:
                  const TextStyle(fontWeight: FontWeight.bold, height: 2),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


