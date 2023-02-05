
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:souq/Bussiness_logic_layer/cubit/SouqStates.dart';
import 'package:souq/Data_layer/Models/ProductModel.dart';
import 'package:souq/Shared/Components/Constants.dart';

class Souq_cubit extends Cubit<Souq_states> {
  List<ProductModel> TelevisionList = [];
  List<ProductModel> printerList = [];
  List<ProductModel> AcessoriesList = [];
  List<ProductModel> GamingList = [];
  List<ProductModel> LabtopList = [];
  List<ProductModel> PhonesList = [];
  List<ProductModel> OfferList = [];
  List<ProductModel> shoesList = [];
  List<ProductModel> sportsList = [];
  List<ProductModel> SportsShoes = [];
  List<ProductModel> adidasList = [];
  List<ProductModel> bootsList = [];
  List<ProductModel> trouserList = [];
  List<ProductModel> FridgeAndCooker = [];
  List<ProductModel> Favourite = [];
  List<String> FavouriteId = [];
  List<ProductModel> orders = [];
  List<String> ordersId = [];
  String? collection;
  int orderSalary =0;
  int numberOfOrderItem =0;
  bool IsEmpty = true;
  bool IsEmpty2 = true;

  Souq_cubit() : super(SouqIntialStates());

  static Souq_cubit get(context) => BlocProvider.of(context);

  Future? GetProducts(List<String> list) /*async*/ {
    emit(GetProductLoadingState());
    list.forEach((collection) async {
      if (collection == 'ElectronicDevice') {
        await FirebaseFirestore.instance
            .collection(collection)
            .get()
            .then((value) {
          TelevisionList = [];
          printerList = [];
          value.docs.forEach((element) {
            // print("element ${element.reference.path}");

            // if (element.reference.path == 'Television') {
            element.reference.collection(/*element.reference.path*/
                'Television').get().then((value) {
              value.docs.forEach((element) {
                // print('element ${element.data()}');
                TelevisionList.add(ProductModel.FromJson(element.data()));
              });
            });
            // }
            element.reference.collection('printer').get().then((value) {
              value.docs.forEach((element) {
                printerList.add(ProductModel.FromJson(element.data()));
              });
            });
            element.reference.collection('FridgeAndCooker').get().then((value) {
              value.docs.forEach((element) {
                FridgeAndCooker.add(ProductModel.FromJson(element.data()));
              });
            });
            // }

            emit(GetProductSuccessState());
          });
        }).catchError((onError) {
          emit(GetProducterrorState(onError.toString()));
        });
      }
      else if (collection == 'Games Acessories') {
        FirebaseFirestore.instance.collection(collection).get().then((value) {
          AcessoriesList = [];
          GamingList = [];
          value.docs.forEach((element) {
            // if (element.reference.path == 'Acessories') {
            element.reference.collection('Acessories').get().then((value) {
              value.docs.forEach((element) {
                AcessoriesList.add(ProductModel.FromJson(element.data()));
              });
            });
            element.reference.collection('Gaming').get().then((value) {
              value.docs.forEach((element) {
                print('element ${element.data()}');
                // print(element[0]);
                GamingList.add(ProductModel.FromJson(element.data()));
              });
            });

            emit(GetProductSuccessState1());
          });
        }).catchError((onError) {
          emit(GetProducterrorState1(onError.toString()));
        });
      }
      else if (collection == 'LaptopAndScreens') {
        FirebaseFirestore.instance.collection(collection).get().then((value) {
          value.docs.forEach((element) {
            LabtopList = [];
            element.reference.collection('Labtop').get().then((value) {
              value.docs.forEach((element) {
                LabtopList.add(ProductModel.FromJson(element.data()));
              });
            });

            emit(GetProductSuccessState2());
          });
        }).catchError((onError) {
          emit(GetProducterrorState2(onError.toString()));
        });
      }
      else if (collection == 'Phones') {
        FirebaseFirestore.instance.collection(collection).get().then((value) {
          PhonesList = [];
          value.docs.forEach((element) {
            PhonesList.add(ProductModel.FromJson(element.data()));
            PhonesList.forEach((element) {});
            emit(GetProductSuccessState3());
          });
        }).catchError((onError) {
          emit(GetProducterrorState3(onError.toString()));
        });
      }
      else if (collection == 'Today\'s Offer') {
        FirebaseFirestore.instance.collection(collection).get().then((value) {
          OfferList = [];
          value.docs.forEach((element) {
            OfferList.add(ProductModel.FromJson(element.data()));
            emit(GetProductSuccessState4());
          });
        }).catchError((onError) {
          emit(GetProducterrorState4(onError.toString()));
        });
      }
      else if (collection == 'man clothes') {
        shoesList = [];
        sportsList = [];
        trouserList = [];
        SportsShoes = [];
        adidasList = [];
        bootsList = [];
        FirebaseFirestore.instance.collection(collection).get().then((value) {
          value.docs.forEach((element) {
            element.reference.collection('sports').get().then((value) {
              value.docs.forEach((element) {
                sportsList.add(ProductModel.FromJson(element.data()));
              });
            });
            element.reference.collection('shoes').get().then((value) {
              value.docs.forEach((element) {
                element.reference.collection('boots').get().then((value) {
                  bootsList.add(ProductModel.FromJson(element.data()));
                });
                element.reference
                    .collection('Sports Shoes')
                    .get()
                    .then((value) {
                  SportsShoes.add(ProductModel.FromJson(element.data()));
                });
                element.reference.collection('adidas').get().then((value) {
                  adidasList.add(ProductModel.FromJson(element.data()));
                });
              });
            });
            element.reference.collection('trouser').get().then((value) {
              value.docs.forEach((element) {
                trouserList.add(ProductModel.FromJson(element.data()));
              });
            });

            emit(GetProductSuccessState5());
          });
        }).catchError((onError) {
          emit(GetProducterrorState5(onError.toString()));
        });
      }
    });
  }

  void changeindexfav(int i) {
    indexfav = i;

    emit(ChangeIndexState());
  }

  void changeIndex2(int i) {
    index2 = i;
    emit(ChangeIndex2State());
  }

  void changeindexorder(int i) {
    indexorder = i;

    emit(ChangeIndexState());
  }



  void changeRating(double? rat) {
    rating = rat;
    emit(changeRatingState());
  }

  void FavouriteInDataBase({
    required String? name,
    required String? image,
    String? image2,
    String? image3,
    String? image4,
    String? image5,
    required String? price,
    String? offerprice,
    String? offer,
    required String? numberOfStars,
    String? Index,
    int? NumberOfOrder,
  }) {
    emit(SetFavouriteProductUserLoadingState());
    ProductModel model = ProductModel(
        name: name,
        image: image,
        image2: image2,
        image3: image3,
        image4: image4,
        image5: image5,
        price: price,
        NumberOfOrder: NumberOfOrder,
        offerprice: offerprice,
        offer: offer,
        numberOfStars: numberOfStars,
        index: Index);
    FirebaseFirestore.instance
        .collection('DataOfUsers')
        .doc(Uid)
        .collection('Favourite')
        .doc()
        .set(model.toMap())
        .then((value) {
      emit(SetFavouriteProductUserSuccessState());
    }).catchError((error) {
      emit(SetFavouriteProductUsererrorState(error.toString()));
    });
  }

  Future? GetFavourite() {
    Favourite = [];
    FavouriteId = [];

    emit(getFavouriteProductUserLoadingState());
    if (Uid != null || Uid != '') {
      FirebaseFirestore.instance
          .collection('DataOfUsers')
          .doc(Uid)
          .collection('Favourite')
          .get()
          .then((value) {
        value.docs.forEach((element) {
          Favourite.add(ProductModel.FromJson(element.data()));
          FavouriteId.add(element.id);
        });
        // print(Favourite.length);
        if (Favourite == [] || Favourite.length == 0) {
          ISFavouriteEmpty(true);
        } else {
          ISFavouriteEmpty(false);
        }
        emit(getFavouriteProductUserSuccessState());
      }).catchError((error) {
        emit(getFavouriteProductUsererrorState(error.toString()));
      });
    }
  }

  Future? DeleteFavouriteItem(index) {
    String id = FavouriteId[index];
    emit(DeleteFavouriteProductUserLoadingState());
    FirebaseFirestore.instance
        .collection('DataOfUsers')
        .doc(Uid)
        .collection('Favourite')
        .doc(id)
        .delete()
        .then((value) {
      GetFavourite();

      emit(DeleteFavouriteProductUserLoadingState());
    }).catchError((error) {
      emit(DeleteFavouriteProductUsererrorState(error.toString()));
    });
  }

  void ISFavouriteEmpty(bool Empty) {
    IsEmpty = Empty;
    emit(ISFavouriteEmptyState());
  }

  void ordersInDataBase({
    required String? name,
    required String? image,
    String? image2,
    String? image3,
    String? image4,
    String? image5,
    required String? price,
    String? offerprice,
    String? offer,
    required String? numberOfStars,
    String? Index,
    int? NumberOfOrder,
  }) {
    emit(SetordersProductUserLoadingState());
    ProductModel model = ProductModel(
        name: name,
        image: image,
        image2: image2,
        image3: image3,
        image4: image4,
        image5: image5,
        price: price,
        NumberOfOrder: NumberOfOrder,
        offerprice: offerprice,
    offer: offer,
    numberOfStars: numberOfStars,
    index: Index);
    FirebaseFirestore.instance
        .collection('DataOfUsers')
        .doc(Uid)
        .collection('orders')
        .doc()
        .set(model.toMap())
        .then((value) {

      emit(SetordersProductUserSuccessState());
    }).catchError((error) {
      emit(SetordersProductUsererrorState(error.toString()));
    });
  }

  Future? Getorders() {


    emit(getordersProductUserLoadingState());
    if (Uid != null || Uid != '') {
      FirebaseFirestore.instance
          .collection('DataOfUsers')
          .doc(Uid)
          .collection('orders')
          .get()
          .then((value) {
        orders = [];
        ordersId = [];
        value.docs.forEach((element) {
          orders.add(ProductModel.FromJson(element.data()));
          ordersId.add(element.id);
        });
        print(orders.length);
        if (orders == [] || orders.length == 0) {

          print('true');

          ISordersEmpty(true);
        } else {
          print('False');
          CalculateSalaryOfOrder();
          numberOfOrderItem++;
          print(orderSalary);
          ISordersEmpty(false);
        }
        emit(getordersProductUserSuccessState());
      }).catchError((error) {
        emit(getordersProductUsererrorState(error.toString()));
      });
    }
  }

  Future? DeleteordersItem(index) {
    String id = ordersId[index];
    emit(DeleteordersProductUserLoadingState());
    FirebaseFirestore.instance
        .collection('DataOfUsers')
        .doc(Uid)
        .collection('orders')
        .doc(id)
        .delete()
        .then((value) {
      Getorders();

      emit(DeleteordersProductUserLoadingState());
    }).catchError((error) {
      emit(DeleteordersProductUsererrorState(error.toString()));
    });
  }
  Future? Deleteorders () {
    // String id = ordersId[index];
    emit(DeleteallordersLoadingState());
    ordersId.forEach((element) {
      FirebaseFirestore.instance
          .collection('DataOfUsers')
          .doc(Uid)
          .collection('orders')
          .doc(element)
          .delete()
          .then((value) {
        emit(DeleteallordersSuccessState());
      }).catchError((error) {
        emit(DeleteallorderserrorState(error.toString()));
      });
    });


  }
  void ISordersEmpty(bool Empty) {
    IsEmpty2 = Empty;
    emit(ISordersEmptyState());
  }
  void ISorder(bool Empty) {
    isorder = Empty;
    emit(ISordersEmptyState());
  }

  void ChangeNubmerOfOrder(int NumberOfOrder) {
    NumberOfOrder=NumberOfOrder;
      emit(ChangeNubmerOfOrderState());
  }
  void CalculateSalaryOfOrder(){
    orderSalary=0;
    orders.forEach((element) {
      orderSalary+=int.parse(element.price!);
    });
  }
}
