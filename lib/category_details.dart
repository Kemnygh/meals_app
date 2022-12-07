import 'package:flutter/material.dart';

class CategoryDetails extends StatelessWidget {
  // final String title;
  const CategoryDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final routeAgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;

    final catgTitle = routeAgs['title'];

    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          title: Text('$catgTitle Recipe'),
        ),
        body: Center(
          child: Text(catgTitle as String),
        ));
  }
}
