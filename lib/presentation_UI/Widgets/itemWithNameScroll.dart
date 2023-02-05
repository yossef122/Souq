import 'package:flutter/material.dart';

class itemWithNameScroll extends StatelessWidget {
/*var context;
 itemWithNameScroll(this.context);*/
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        height: 400,
        width: 200,
        child: Padding(
          padding: const EdgeInsetsDirectional.only(start: 30, end: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  height: 200,
                  width: 200,
                  child: const Image(
                    image: AssetImage('assets/images/1Ph_.jpg'),
                    height: 170,
                    width: 170,
                  )),
              Text(
                'Smasung Galaxy A23,two  lines',
                style: Theme.of(context)
                    .textTheme
                    .subtitle1!
                    .copyWith(fontSize: 15, color: Colors.cyan),
              ),
              Text(
                '128 Giga,4 Ram',
                style: Theme.of(context)
                    .textTheme
                    .subtitle1!
                    .copyWith(fontSize: 15, color: Colors.cyan),
              ),
              Text(
                'Color white',
                style: Theme.of(context)
                    .textTheme
                    .subtitle1!
                    .copyWith(fontSize: 15, color: Colors.cyan),
              ),
              const SizedBox(
                height: 3,
              ),
              Text(
                '5,737.90 Egp',
                style: Theme.of(context)
                    .textTheme
                    .subtitle1!
                    .copyWith(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(17),
                  color: Colors.yellowAccent,
                ),
                child: MaterialButton(
                  onPressed: () {},
                  child: const Text('Add To Card'),
                ),
              ),
            ],
          ),
        ));
  }
}
