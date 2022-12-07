import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './category_details.dart';

import 'home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      // change color of navigation bar
      systemNavigationBarColor: Color.fromRGBO(39, 38, 38, 1),
    ));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meal App',
      theme: ThemeData(
          canvasColor: const Color.fromRGBO(39, 38, 38, 1),
          colorScheme: ColorScheme.fromSwatch().copyWith(
              primary: const Color.fromRGBO(39, 38, 38, 1),
              secondary: const Color.fromRGBO(119, 207, 75, 1)),
          textTheme: ThemeData.light().textTheme.copyWith(
              headline6: const TextStyle(
                  fontFamily: 'Quicksand', fontWeight: FontWeight.w300),
              bodyText2: const TextStyle(
                  fontFamily: 'baloo',
                  fontWeight: FontWeight.normal,
                  color: Colors.white),
              bodyText1: const TextStyle(
                  fontFamily: 'Quicksand',
                  fontWeight: FontWeight.normal,
                  color: Colors.white))),
      home: const MyHomePage(),
      routes: {'/category-details': (context) => CategoryDetails()},
    );
  }
}
