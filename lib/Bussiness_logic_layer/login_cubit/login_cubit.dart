import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:souq/Bussiness_logic_layer/login_cubit/login_States.dart';



class login_cubit extends Cubit<login_states> {

  login_cubit() :super(loginIntialStates());

  static login_cubit get(context) => BlocProvider.of(context);

  void UserLogin({
    required String email,
    required String password,
  }) {
    emit(loginLoadingState());

    FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email, password: password
    ).then((value) {
      emit(loginSuccessState(value.user?.uid));
    }).catchError((error) {
      emit(loginerrorState(error.toString()));
    });
  }

  void SignOut({
    required String email,
    required String password,
  }) {
    emit(SignOutLoadingState());
    FirebaseAuth.instance.signOut().then((value) {
      emit(SignOutSuccessState());
    }).catchError((error) {
      emit(SignOuterrorState(error.toString()));
    });
  }

  signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth = await googleUser
        ?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    await FirebaseAuth.instance.signInWithCredential(credential)
        .then((value) {
      emit(loginSuccessState(value.user?.uid));
    }).catchError((error) {
      emit(loginerrorState(error.toString()));
    });
    // return result;
  }


}