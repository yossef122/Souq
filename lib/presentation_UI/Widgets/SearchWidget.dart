import 'package:flutter/material.dart';
import 'package:souq/Shared/Components/Components.dart';
import 'package:souq/presentation_UI/Modules/Search_Screen/SearchScreen.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.cyanAccent,
      decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Colors.cyanAccent,
            Colors.white,
          ],
            begin: Alignment.topLeft,
            end: Alignment.topRight,
          )
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.only(
            start: 15, end: 15, top: 40, bottom: 14),
        child: InkWell(
          child: Container(
            height: 40,
            width: double.infinity,
            clipBehavior: Clip.antiAlias,
            decoration: const BoxDecoration(
                borderRadius: BorderRadiusDirectional.all(
                  Radius.circular(8),
                ),
                color: Colors.white
            ),
            child: TextFormField(
              onTap: () {
                navigatorBuilder(context, SearchScreen());
              },
              maxLines: 1,
              decoration: const InputDecoration(
                  hintText: 'Search Souq.eg ',
                  hintStyle: TextStyle(
                    fontFamily: 'Lobster',

                  ),
                  suffixIcon: Icon(Icons.search),
                  border: OutlineInputBorder()),
            ),
          ),
        ),
      ),
    )    ;
  }
}
