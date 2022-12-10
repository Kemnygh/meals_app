import 'package:flutter/material.dart';
import 'package:meals_app/screens/category_details.dart';

import '../widgets/category_item.dart';
import '../data.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    String cargTitle = '';
    String catgId = '';
    Color catgColor;

    // void selectCategory(BuildContext ctx) {
    //   Navigator.of(ctx).push(MaterialPageRoute(builder: (_) {
    //     return CategoryDetails(recipeTitle);
    //   }));
    // }

    void selectCategory(BuildContext ctx) {
      Navigator.of(ctx).pushNamed(CategoryDetails.routeName, arguments: {
        'title': cargTitle,
        'id': catgId,
        'color': catgColor = Colors.transparent
      });
    }

    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          title: const Text('Your Meal App'),
        ),
        body: GridView(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 2 / 3,
              // crossAxisSpacing: 10,
              mainAxisSpacing: 10),
          children: categorieList.map((ctgy) {
            return InkWell(
                onTap: () {
                  cargTitle = ctgy.title;
                  catgId = ctgy.id;
                  catgColor = ctgy.color;
                  selectCategory(context);
                },
                splashColor: ctgy.color,
                borderRadius: BorderRadius.circular(12),
                child: CategoryItem(ctgy));
          }).toList(),
        ));
  }
}
