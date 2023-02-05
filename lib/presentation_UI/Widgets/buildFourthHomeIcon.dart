import 'package:flutter/material.dart';

class buildFourthHomeIcon extends StatelessWidget {
  String image;
  String text;
  buildFourthHomeIcon({
    required this.image,
    required this.text
});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 190,
      width: 150,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            // color: Colors.grey,
            // width: double.infinity,
            child: Padding(
              padding: const EdgeInsetsDirectional.only(start: 20, end: 20),
              child: Container(
                  height: 130,
                  child:  Image(
                    // image: AssetImage('assets/images/Arpods.png'),
                    image: NetworkImage(image),
                    height: 70,
                    width: 100,
                  )),
            ),
          ),
           Padding(
            padding: const EdgeInsetsDirectional.only(start: 5, end: 5),
            child: Center(
              child: Text(
                // 'Electronics',
                text,
                style: const TextStyle(fontWeight: FontWeight.bold, height: 2,fontSize: 15),
              ),
            ),
          ),
        ],
      ),
    );

  }
}
