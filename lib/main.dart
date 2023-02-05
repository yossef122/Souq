import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:souq/Bussiness_logic_layer/BlocObserve/BlocObserve.dart';
import 'package:souq/Bussiness_logic_layer/cubit/SouqCubit.dart';
import 'package:souq/Bussiness_logic_layer/cubit/SouqStates.dart';
import 'package:souq/Data_layer/Network/CasheHelper/CasheHelper.dart';

import 'package:souq/Shared/Components/Constants.dart';
import 'package:souq/presentation_UI/Layout_Screen/LayOut_Screen.dart';
import 'package:souq/presentation_UI/Modules/Country_language_screen/Country_language_Screen.dart';

import 'presentation_UI/Modules/SplashScreen/SplashScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await Firebase.initializeApp();
  await   CasheHelper.Init();

  // await GoogleSignIn().hostedDomain;

  Uid=CasheHelper.Getdata(key: 'Uid');
  print(CasheHelper.Getdata(key: 'Uid'));
  Widget start;
  if(Uid == null || Uid == ''){
    start=Country_language_Screen();
  }else{
      start=LayOut_Screen();
  }

  runApp(souqApp(widget: start,));
}

class souqApp extends StatelessWidget {
   // String?uid;
  Widget widget;
   souqApp({
   required this.widget
   });
   @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) =>
            Souq_cubit()..GetProducts(HomeProduct),
        child: BlocConsumer<Souq_cubit, Souq_states>(
          listener: (context, state) {},
          builder: (context, state) =>  MaterialApp(
            home: Splash_Screen(start:widget),

            debugShowCheckedModeBanner: false,
          ),
        )
    );
  }
}

