import 'package:flutter/material.dart';
import 'package:souq/presentation_UI/Widgets/buildSixthHomeIcon.dart';

class build9ImageWithText extends StatelessWidget {
  String text;
  String image;
  CrossAxisAlignment crossAxisAlignment;
  BoxFit? fit;
  var function;

  build9ImageWithText(this.text, this.image, this.crossAxisAlignment, this.fit,
      {this.function});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function,
      child: Container(
        color: Colors.white,
        height: 550,
        // width: ,
        child: Column(
          crossAxisAlignment: crossAxisAlignment,
          children: [
            Padding(
              padding:
                  const EdgeInsetsDirectional.only(start: 10, end: 10, top: 20),
              child: Text(
                ' ${text}',
                style: const TextStyle(
                  fontFamily: 'Lobster',
                  fontSize: 21,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              height: 440,
              child: Padding(
                padding: const EdgeInsetsDirectional.only(end: 10),
                child: GridView.count(
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 3,
                  children: List.generate(
                      9, (index) => buildSixthHomeIcon(image, fit)),
                  shrinkWrap: false,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 1 / 1.1,
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
      ),
    );
  }
}
