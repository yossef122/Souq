import 'dart:developer';

import 'package:flutter/material.dart';

class buildofferIcon  extends StatelessWidget {

  String? image;
  String? number;

  var function;
  buildofferIcon(this.image,this.number,{

   this.function
    });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function,
      child: Card(
        // height: 190,
        // width: 210,
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 40, end: 20),
              child: Container(
                  height: 130,
                  color: Colors.white,
                  child: Image(
                    // image: NetworkImage('assets/images/Arpods.png'),

                    image: NetworkImage('$image'),

                    height: 70,

                    width: 100,
                  )),
            ),
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 5, end: 5),
              child: Row(
                children: [
                  Container(
                      color: Colors.red[500],
                      child: Text(
                        'offers up to ${number!.toUpperCase()}%',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.white),
                      )),
                  const SizedBox(
                    width: 3,
                  ),
                  Text(
                    'best offers',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        color: Colors.red[500],
                        height: 2),
                  )
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsetsDirectional.only(start: 5, end: 5),
              child: Text(

                'Save Your money',
                style: TextStyle(
                    fontFamily: 'Lobster',
                    fontWeight: FontWeight.normal,
                    height: 2),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
