import 'dart:ffi';

class ProductModel {
   String? name;
   String? image;
   String? image2;
   String? image3;
   String? image4;
   String? image5;
   String? price;
   String? offerprice;
   String? offer;
   String? numberOfStars;
   String? index;
   int? NumberOfOrder;


  ProductModel({
    required this.name,
    required this.image,
    required this.price,
    required this.image2,
    required this.image3,
    required this.image4,
    required this.image5,
    required this.numberOfStars,
    required this.offer,
    required this.offerprice,
    required this.index,
     this.NumberOfOrder,

  });

  ProductModel.FromJson(Map<String, dynamic> json) {
    name = json['name'];
    numberOfStars = json['numberOfStars'];
    image = json['image'];
    price = json['price'];
    offer = json['offer'];
    offerprice = json['offerprice'];
    image2 = json['image2'];
    image3 = json['image3'];
    image4 = json['image4'];
    image5 = json['image5'];
    index = json['index'];
    NumberOfOrder = json['NumberOfOrder'];
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name ,
      'image': image ,
      'image2': image2 ,
      'image3': image3 ,
      'image4': image4 ,
      'image5': image5 ,
      'price': price ,
      'offer': offer ,
      'offerprice': offerprice ,
      'numberOfStars': numberOfStars ,
      'index': index ,
      'NumberOfOrder': NumberOfOrder ,
    };
  }
}
