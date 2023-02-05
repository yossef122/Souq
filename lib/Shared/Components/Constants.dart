import 'package:flutter/material.dart';

var Navbar_home_layout_Current_Index = 0;
IconData? selectedIcon;
double? rating;
String? Uid = '';
var SelectedItem = null;
var SelectedItem2 = null;
int? loginOrRegister = 2;

// BuildContext? context;
// var cubit=Souq_cubit.get(context);
int index = 0;
int index2 = 0;
int indexfav = 0;
int indexorder = 0;
List<String> HomeProduct = [
  'ElectronicDevice',
  'Games Acessories',
  'LaptopAndScreens',
  'Phones',
  'Today\'s Offer',
  'man clothes'
];

int NumberOfOrder = 1;
bool isorder = false;

List<String> model = [
  'https://img.freepik.com/free-psd/modern-sales-banner-template_23-2148995448.jpg?w=2000',
  // 'https://img.freepik.com/premium-vector/vector-black-friday-poster-banner-with-black-gift-box-coins-coupon-shopping-bag_139523-705.jpg?w=2000',
  'https://image.shutterstock.com/image-illustration/special-offer-sales-banner-shop-260nw-2046644237.jpg',
  'https://media.istockphoto.com/vectors/super-sale-banner-vector-id624895912?k=20&m=624895912&s=170667a&w=0&h=PbOdePJDJkg0pUBdqB2zi0eRhL_h5vhpDHBP8MSNhlY='
];

List<String> SearchModelimage = [
  'https://images-na.ssl-images-amazon.com/images/G/01/DiscoTec/2022/T5/GW/DQC/BFCM22_DQC_T5_XCAT_01_FASHION_1X._SY116_CB606693756_.jpg',
  'https://m.media-amazon.com/images/I/81ldhum0M4L._AC_SY200_.jpg',
  'https://images-na.ssl-images-amazon.com/images/G/01/DiscoTec/2022/HOL22/GW/DesktopShoveler/Shoveler_Electronics_1x._CB608464074_.jpg',
  'https://m.media-amazon.com/images/I/81Ivn5DIxhL._AC_SY200_.jpg',
  'https://m.media-amazon.com/images/I/310h99v0h1L._AC_SY200_.jpg',
  'https://images-na.ssl-images-amazon.com/images/G/01/DiscoTec/2022/T5/GW/DQC/BFCM22_DQC_T5_XCAT_02_KITCHEN_1X._SY116_CB606693756_.jpg',
  'https://images-na.ssl-images-amazon.com/images/G/01/DiscoTec/2022/T5/GW/DQC/BFCM22_DQC_T5_XCAT_01_VIDEO_GAMES_1X._SY116_CB604925115_.jpg',
];
List<String> SearchModelProduct = [
  'clothes',
  'Phones',
  'Games Accessories',
  'Laptop',
  'Tv ',
  'ElectronicDevice',
  'Gaming',
];

List<Color> GragientColor = [
  Colors.white,
  Colors.cyanAccent,
];
