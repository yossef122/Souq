import 'package:flutter/material.dart';

class build1imageWithText2 extends StatelessWidget {

  String text; String image; CrossAxisAlignment crossAxisAlignment;
  build1imageWithText2 (this.text, this.image, this.crossAxisAlignment);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 370,
      child: Column(
        crossAxisAlignment: crossAxisAlignment,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.only(
                end: 9, bottom: 20, start: 9, top: 15),
            child: Text(
              text,
              style: const TextStyle(
                  fontFamily: 'Lobster',

                  fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Center(
              child: Container(
                // color: Colors.grey[100],
                  child: Image(
                    image: NetworkImage(image),
                    height: 300,
                    width: 350,
                  )))
        ],
      ),
    );
  }
}
