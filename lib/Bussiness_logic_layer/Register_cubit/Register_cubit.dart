import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:souq/Bussiness_logic_layer/Register_cubit/Register_States.dart';
import 'package:souq/Data_layer/Models/UsersModel.dart';

class Register_cubit extends Cubit<RegisterState>{

  Register_cubit():super(RegisterIntialStates());
  static Register_cubit get(context)=>BlocProvider.of(context);
  void UserRegister(
  {
 required String email,
 required String password,
 required String Phone,
 required String name,
 required String Country,
    }
      ){
    emit(RegisterLoadingState());
    FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password
    ).then((value) {
      UserCreateInDataBase(
          email: email,
          password: password,
        name: name,
        Phone: Phone,
        Country: Country,
        uId: value.user!.uid
      );
    }).catchError((error){
      print('Error 1');
      emit(RegisterErrorState(error.toString()));
    });

  }

  void UserCreateInDataBase(
      {
        required String email,
        required String password,
        required String Phone,
        required String name,
        required String uId,
        required String Country,

      }
      ){
    UserModel model=UserModel(
      name: name,
      email: email,
      Phone: Phone,
      password: password,
      Country: Country,
    );
    FirebaseFirestore.instance.collection('DataOfUsers').doc(uId).set(model.toMap()).then((value) {
      emit(RegisterSuccessState(uId));

    }).catchError((error){
      print('Error 2');

      emit(RegisterErrorState(error.toString()));
    });

  }
}