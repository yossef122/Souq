// ignore_for_file: sized_box_for_whitespace

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:souq/Bussiness_logic_layer/cubit/SouqCubit.dart';
import 'package:souq/Bussiness_logic_layer/cubit/SouqStates.dart';

import 'package:souq/Shared/Components/Components.dart';
import 'package:souq/Shared/Components/Constants.dart';
import 'package:souq/presentation_UI/Widgets/SearchWidget.dart';
import 'package:souq/presentation_UI/Widgets/build1imageWithText.dart';
import 'package:souq/presentation_UI/Widgets/build1imageWithText2.dart';
import 'package:souq/presentation_UI/Widgets/build4ImageWithText.dart';
import 'package:souq/presentation_UI/Widgets/build4ImageWithText2.dart';
import 'package:souq/presentation_UI/Widgets/build9ImageWithText.dart';
import 'package:souq/presentation_UI/Widgets/build9ImageWithText2.dart';
import 'package:souq/presentation_UI/Widgets/buildFirstHomeIcon.dart';
import 'package:souq/presentation_UI/Widgets/buildFourthHomeIcon.dart';
import 'package:souq/presentation_UI/Widgets/buildofferhome.dart';

class Home_Screen extends StatelessWidget {
  Home_Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocConsumer<Souq_cubit, Souq_states>(
      listener: (context, state) {},
      builder: (context, state) => Column(
        children: [
          const SearchWidget(),
          Expanded(
            child: Container(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ChooseLocation(),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 90,
                      child: ListView.separated(
                          physics: const BouncingScrollPhysics(),
                          // shrinkWrap: false,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => buildFirstHomeIcon(),
                          separatorBuilder: (context, index) =>
                              const SizedBox(),
                          itemCount: 10),
                    ),
                    Container(
                      height: 260,
                      width: double.infinity,
                      child: Stack(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        alignment: AlignmentDirectional.bottomStart,
                        children: [
                          CarouselSlider(
                              items: model /*!.data!.banners*/
                                  .map((e) => Image(
                                        image: NetworkImage('${e /*.image*/}'),
                                        height: double.infinity,
                                        fit: BoxFit.cover,
                                      ))
                                  .toList(),
                              options: CarouselOptions(
                                height: 235,
                                initialPage: 0,
                                enableInfiniteScroll: true,
                                //هيفضل يلف حوالين نفسه
                                reverse: false,
                                // عشان ميتقلبش
                                autoPlay: true,
                                viewportFraction: 1,
                                autoPlayInterval: const Duration(seconds: 4),
                                //هياخد وقت قد اي عقبال م يقلب
                                autoPlayAnimationDuration:
                                    const Duration(seconds: 1),
                                autoPlayCurve: Curves.fastOutSlowIn,
                                scrollDirection: Axis.horizontal,
                              )),
                        ],
                      ),
                    ),
                    Container(
                      height: 55,
                      color: Colors.blue,
                      child: Padding(
                        padding: const EdgeInsetsDirectional.only(
                            start: 15, end: 15),
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                SizedBox(
                                  height: 6,
                                ),
                                Text(
                                  'Shopping and save your Money',
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontFamily: 'Lobster',
                                      color: Colors.white,
                                      fontWeight: FontWeight.normal),
                                ),
                                Text('and play anews games with prieum',
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontFamily: 'Lobster',
                                        color: Colors.white,
                                        fontWeight: FontWeight.normal)),
                              ],
                            ),
                            Spacer(),
                            const Image(
                                image: AssetImage(
                                    'assets/images/GameingIcon.png')),
                          ],
                        ),
                      ),
                    ),
                    HomeSeperator(),
                    //offers
                    buildofferhome(Souq_cubit.get(context).OfferList, context),
                    HomeSeperator(),
                    Container(
                      height: 245,
                      width: double.infinity,
                      color: Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsetsDirectional.only(
                                start: 10, end: 10, top: 10),
                            child: Text(
                              'Saving Corner',
                              style: TextStyle(
                                  fontFamily: 'Lobster',
                                  fontWeight: FontWeight.normal,
                                  fontSize: 20),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            height: 190,
                            child: Padding(
                              padding: const EdgeInsetsDirectional.only(
                                  start: 10, end: 10),
                              child: ListView.separated(
                                  physics: const BouncingScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) =>
                                      buildFourthHomeIcon(
                                        image: SearchModelimage[index],
                                        text: SearchModelProduct[index],
                                      ),
                                  separatorBuilder: (context, index) =>
                                      Container(
                                        width: 12,
                                      ),
                                  itemCount: SearchModelimage.length),
                            ),
                          ),
                        ],
                      ),
                    ),
                    HomeSeperator(),
                    build4ImageWithText2(
                      'Recently Arrived | Clothes for mans',
                      Souq_cubit.get(context).trouserList,
                      'Man Clothes',
                      CrossAxisAlignment.start,
                      BoxFit.fill,
                      context,
                    ),
                    HomeSeperator(),
                    build4ImageWithText2(
                      'Televisions | offers up to 20 % ',
                      Souq_cubit.get(context).TelevisionList,
                      'up to 39 inch',
                      CrossAxisAlignment.start,
                      BoxFit.cover,
                      context,
                    ),
                    HomeSeperator(),
                    build4ImageWithText2(
                      'Best Games ',
                      Souq_cubit.get(context).GamingList,
                      'Unique Games',
                      CrossAxisAlignment.start,
                      BoxFit.contain,
                      context,
                    ),

                    HomeSeperator(),
                    build4ImageWithText2(
                      'Best Accessories for  Games ',
                      Souq_cubit.get(context).AcessoriesList,
                      'Games Accessories',
                      CrossAxisAlignment.start,
                      BoxFit.scaleDown,
                      context,
                    ),
                    HomeSeperator(),
                    build1imageWithText(
                        ' security cameras | offers up to 35 % ',
                        'assets/images/security cameras.png',
                        CrossAxisAlignment.start),
                    HomeSeperator(),
                    build1imageWithText2(
                        ' Sports Shoes | offers up to 35 % ',
                        'https://s.alicdn.com/@sc04/kf/H04fa491ae63144fc8b46ef5387c8b468r.jpg_280x280.jpg',
                        CrossAxisAlignment.start),
                    HomeSeperator(),
                    build1imageWithText2(
                        ' Boots | offers up to 35 % ',
                        'https://m.media-amazon.com/images/I/4139DGa+5jL._AC_SY580_.jpg',
                        CrossAxisAlignment.start),
                    HomeSeperator(),
                    build1imageWithText2(
                        ' Adidas shoes | offers up to 35 % ',
                        'https://eg.jumia.is/unsafe/fit-in/300x300/filters:fill(white)/product/80/155982/1.jpg?4051',
                        CrossAxisAlignment.start),
                    HomeSeperator(),
                    build9ImageWithText2(
                      Souq_cubit.get(context).FridgeAndCooker,
                      'Big electric Devices',
                      CrossAxisAlignment.start,
                      BoxFit.fill,
                      context,
                    ),
                    HomeSeperator(),
                    build1imageWithText(
                        'كابات عليها اسمك او برجك || اجدد ماوصلنا',
                        'assets/images/1-transformed.png',
                        CrossAxisAlignment.end),
                    HomeSeperator(),
                    build1imageWithText(
                        'discover a huge number of laptops',
                        'assets/images/best_1laptops.jpg',
                        CrossAxisAlignment.start),
                    HomeSeperator(),
                    build9ImageWithText2(
                      Souq_cubit.get(context).PhonesList,
                      'Best Choice of mobiles',
                      CrossAxisAlignment.start,
                      BoxFit.scaleDown,
                      context,
                    ),
                    HomeSeperator(),
                    build4ImageWithText2(
                      'Sports clothes for man ',
                      Souq_cubit.get(context).sportsList,
                      '',
                      CrossAxisAlignment.start,
                      BoxFit.scaleDown,
                      context,
                    ),
                    HomeSeperator(),
                    build1imageWithText(
                        'Kids Games',
                        'assets/images/BEST-GAMES-FOR-KIDS-square.png',
                        CrossAxisAlignment.start),
                    HomeSeperator(),
                    build1imageWithText('Recently Arrived | Watches for man',
                        'assets/images/Watches.png', CrossAxisAlignment.start),
                    HomeSeperator(),
                    build1imageWithText(
                        'Recently Arrived | Sunglasses',
                        'assets/images/Sunglasses.png',
                        CrossAxisAlignment.start),
                    HomeSeperator(),
                    build1imageWithText('speakers ',
                        'assets/images/speakers.png', CrossAxisAlignment.start),
                    HomeSeperator(),
                    build4ImageWithText(
                        'Recently Arrived | Clothes for women',
                        'woman Clothes',
                        'assets/images/woman.jpg',
                        CrossAxisAlignment.start,
                        BoxFit.fill),
                    HomeSeperator(),
                    build1imageWithText(
                        'Recently Arrived | Bages ',
                        'assets/images/TravelBags.jpg',
                        CrossAxisAlignment.start),
                    HomeSeperator(),
                    build4ImageWithText2(
                        'Ready for Scan or Print',
                        Souq_cubit.get(context).printerList,
                        'Digital Printer',
                        CrossAxisAlignment.start,
                        null,
                        context),
                    HomeSeperator(),
                    build4ImageWithText(
                        'Schools tools',
                        'Books',
                        'assets/images/books-logo.png',
                        CrossAxisAlignment.start,
                        BoxFit.fill),
                    HomeSeperator(),
                    build9ImageWithText('pampers for your childern',
                        'assets/images/81.jpg', CrossAxisAlignment.start, null),
                    HomeSeperator(),
                    HomeSeperator(),
                    Container(
                      height: 30,
                      width: double.infinity,
                      color: Colors.grey[400],
                      child: const Center(
                          child: Text(
                              'ــــــــــــــــــــــــــــــــــــyou finally arrive the end ! ــــــــــــــــــــــــــــــــــــــــ')),
                    ),
                    HomeSeperator(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    )
        // )
        );
  }
}
