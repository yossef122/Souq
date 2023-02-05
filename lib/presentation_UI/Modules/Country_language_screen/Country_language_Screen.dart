import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:souq/Shared/Components/Constants.dart';

import '../SignOrLoginScreen/SignOrLoginScreen.dart';

class Country_language_Screen extends StatelessWidget {
  Country_language_Screen({Key? key}) : super(key: key);
  var formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formkey,
        child: Padding(
          padding:
              const EdgeInsetsDirectional.only(start: 12, end: 12, top: 30),
          child: Column(
            children: [
              Stack(
                alignment: AlignmentDirectional.topEnd,
                children: [
                  Container(
                      width: double.infinity,
                      height: 200,
                      child: const Image(
                        image: AssetImage('assets/images/demo.png'),
                        fit: BoxFit.cover,
                      )),
                  const CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 25,
                    child: Icon(
                      Icons.cancel_outlined,
                      color: Colors.black,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 35,
              ),
              Text(
                'Souq is an international Company',
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    fontFamily: 'Lobster',
                    fontSize: 17,
                    fontWeight: FontWeight.normal),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Which Country/region do you want to do shopping from?',
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      fontFamily: 'Lobster',
                      fontSize: 14,
                    ),
              ),
              const SizedBox(
                height: 20,
              ),
              DropdownSearch<String>(
                popupProps: PopupProps.menu(
                  showSelectedItems: true,
                  disabledItemFn: (String s) => s.startsWith('I'),
                ),
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return 'Country should be choosed';
                  }
                  return null;
                },
                items: const ["EGYPT", "USA", "Saudia Arbia", 'London'],
                dropdownDecoratorProps: const DropDownDecoratorProps(
                  dropdownSearchDecoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "you country",
                    hintText: "country",
                  ),
                ),
                onChanged: (e) {
                  SelectedItem = e;
                },
                selectedItem: SelectedItem,
              ),
              const SizedBox(
                height: 20,
              ),
              DropdownSearch<String>(
                popupProps: PopupProps.menu(
                  showSelectedItems: true,
                  disabledItemFn: (String s) => s.startsWith('I'),
                ),
                items: const ["Arabic", "English"],
                dropdownDecoratorProps: const DropDownDecoratorProps(
                  dropdownSearchDecoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Language",
                    hintText: "Choose Language",
                  ),
                ),
                onChanged: (e) {
                  SelectedItem2 = e;
                },
                selectedItem: SelectedItem2,
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsetsDirectional.only(start: 1, end: 1),
                child: Container(
                    height: 40,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (formkey.currentState!.validate()) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const SignOrLogin_Screen()));
                        }
                      },
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.blue)),
                      child: const Text(
                        'Save',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontFamily: 'Lobster',
                        ),
                      ),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
