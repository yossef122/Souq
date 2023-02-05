import 'package:flutter/material.dart';
import 'package:souq/presentation_UI/Widgets/buildFifthHomeIcon.dart';

class build4ImageWithText extends StatelessWidget {
  String mainText;
  String textUnderEveryPhoto;
  String image;
  CrossAxisAlignment crossAxisAlignment;
  BoxFit? fit;

  build4ImageWithText(this.mainText, this.textUnderEveryPhoto, this.image,
      this.crossAxisAlignment, this.fit);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 505,
      // width: ,
      child: Column(
        crossAxisAlignment: crossAxisAlignment,
        children: [
          Padding(
            padding:
                const EdgeInsetsDirectional.only(start: 10, end: 10, top: 20),
            child: Text(
              mainText,
              style: const TextStyle(
                  fontFamily: 'Lobster',
                  fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          Container(
            height: 410,
            child: Padding(
              padding: const EdgeInsetsDirectional.only(start: 10, end: 10),
              child: GridView.count(
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                children: List.generate(
                    4,
                    (index) =>
                        buildFifthHomeIcon(textUnderEveryPhoto, image, fit)),
                shrinkWrap: false,
                mainAxisSpacing: 5,
                crossAxisSpacing: 5,
                childAspectRatio: 1.3 / 1.5,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(start: 10, end: 10),
            child: TextButton(
                onPressed: () {},
                child: const Text(
                  'Shopping More !',
                  style: TextStyle(fontFamily: 'Lobster', fontSize: 17),
                )),
          )
        ],
      ),
    );
    ;
  }
}
