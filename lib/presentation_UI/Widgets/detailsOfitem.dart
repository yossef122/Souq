import 'package:flutter/material.dart';
import 'package:souq/Shared/Components/Components.dart';

class detailsOfitem extends StatelessWidget {

   String textOfGreyRegion;
   String textOfWhiteRegion;
   detailsOfitem({
    required this.textOfGreyRegion,
     required   this.textOfWhiteRegion,
});
  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Container(
          color: Colors.grey[200],
          height: 50,
          width: 100,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: paddingBuilder(start: 10),
                child: Text(
                  textOfGreyRegion,
                  style: const TextStyle(fontSize: 15, color: Colors.black),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          width: 25,
        ),
        Text(
          textOfWhiteRegion,
          style: const TextStyle(fontSize: 15),
        ),
      ],
    );
  }
}
