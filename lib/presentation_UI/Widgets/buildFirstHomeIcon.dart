import 'package:flutter/material.dart';

class buildFirstHomeIcon extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 5, end: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 90,
            height: 90,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                const CircleAvatar(
                  radius: 80,
                  backgroundColor: Colors.white12,
                  child: Image(
                    image: AssetImage(
                        'assets/images/shopping-cart-transformed.png'),
                  ),
                ),
                Container(
                  width: 90,
                  color: Colors.white,
                  child: Row(
                    children: const [
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Shopping',
                        style: TextStyle(
                            // fontFamily: 'Hello Kalin',
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
