import 'package:flutter/material.dart';

class build1imageWithText extends StatelessWidget {
  String text; String image; CrossAxisAlignment crossAxisAlignment;
  build1imageWithText (this.text, this.image, this.crossAxisAlignment);

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

                  fontSize: 20, fontWeight: FontWeight.normal),
            ),
          ),
          Center(
              child: Container(
                // color: Colors.grey[100],
                  child: Image(
                    image: AssetImage(image),
                    height: 300,
                    width: 350,
                  )))
        ],
      ),
    );
  }
}
