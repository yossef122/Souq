import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:souq/Bussiness_logic_layer/cubit/SouqCubit.dart';
import 'package:souq/Bussiness_logic_layer/cubit/SouqStates.dart';

import 'package:souq/Shared/Components/Components.dart';
import 'package:souq/Shared/Components/Constants.dart';
import 'package:souq/presentation_UI/Widgets/SearchWidget.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);
  IconData? selectedIcon;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<Souq_cubit, Souq_states>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            body: Container(
              child: Column(
                children: [
                  const SearchWidget(),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          ListView.separated(
                            shrinkWrap: true,
                            physics: BouncingScrollPhysics(),
                            itemBuilder: (context, index) => itemSearch(
                              SearchModelimage[index],
                              SearchModelProduct[index],
                              /*function: () {
                                  navigatorBuilder(
                                      context, ShoppingMoreScreen()
                                  );
                                }*/
                            ),
                            separatorBuilder: (context, index) => Container(
                              height: 5,
                            ),
                            itemCount: SearchModelimage.length,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
