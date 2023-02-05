import 'package:flutter/material.dart';
import 'package:souq/Bussiness_logic_layer/cubit/SouqCubit.dart';
import 'package:souq/Data_layer/Network/CasheHelper/CasheHelper.dart';

import 'package:souq/Shared/Components/Constants.dart';
import 'package:souq/presentation_UI/Modules/Home_Screen/Home_Screen.dart';
import 'package:souq/presentation_UI/Modules/SettingScreen/Setting_Screen.dart';
import 'package:souq/presentation_UI/Modules/ShoopingCardScreen/ShoopingScreen.dart';
import 'package:souq/presentation_UI/Modules/UsersScreen/Users_Screen.dart';
class LayOut_Screen extends StatefulWidget {
  // LayOut_Screen({Key? key}) : super(key: key);
  int? indexO;
  LayOut_Screen({Key? key,
    this.indexO
    }) : super(key: key);
  @override
  State<LayOut_Screen> createState() => LayOut_ScreenState(indexO: indexO);
}

class LayOut_ScreenState extends State<LayOut_Screen> {

  int? indexO;
  LayOut_ScreenState({
    this.indexO
  });
  List<Widget> Screens = [
    Home_Screen(),
    const Users_Screen(),
    const ShoopingCard_Screen(),
    const Setting_Screen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Screens[Navbar_home_layout_Current_Index],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Favourite'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_outlined), label: 'ShoppingCard'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings_rounded), label: 'Setting'),
        ],
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey[400],
        currentIndex: Navbar_home_layout_Current_Index,
        onTap: (index) {
          setState(() {
            if(indexO!=null) {
              Navbar_home_layout_Current_Index = 0;
            }
            Navbar_home_layout_Current_Index = index;
            if (index == 1) {
              Uid = CasheHelper.Getdata(key: 'Uid');
              if (Uid != '') {
                Souq_cubit.get(context).GetFavourite();
              }
            }
            if (index == 2) {
              Uid = CasheHelper.Getdata(key: 'Uid');
              if (Uid != '') {
                Souq_cubit.get(context).Getorders();
                // print(Souq_cubit.get(context).orders);
              }
            }

          });
        },
      ),
    );
  }
}
