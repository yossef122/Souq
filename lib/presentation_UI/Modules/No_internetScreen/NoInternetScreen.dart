import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:souq/Shared/Components/Components.dart';

class No_internetScreen extends StatelessWidget {
  const No_internetScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<ConnectivityResult>(
          stream: Connectivity().onConnectivityChanged,
          builder: (context, snapshot) {
            return
                /*snapshot.data==ConnectivityResult.none?*/
                Container(
                  color: Colors.white,
                  child: Padding(

              padding: paddingBuilder(start: 20),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(

                        child:
                        /*Image(

                            image: AssetImage('assets/images/NoInternet.png')
                        )*/
                      Lottie.asset('assets/animation/internet-connection.json'),
                    ),
                    Padding(
                      padding: paddingBuilder(start: 32),
                      child: Container(
                          height: 150,
                          child: Text(
                            'No connection Internet ,Please Check Your Internet',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(fontSize: 40),
                          )),
                    ),
                  ],
              ),
            ),
                )
                /*:
          navigatorBuilderAndfinish(context, Country_language_Screen())*/
                ;
          }),
    );
  }
}
