import 'package:flutter/material.dart';

import './data.dart';
import './category_item.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    String recipeTitle = '';

    // void selectCategory(BuildContext ctx) {
    //   Navigator.of(ctx).push(MaterialPageRoute(builder: (_) {
    //     return CategoryDetails(recipeTitle);
    //   }));
    // }

    void selectCategory(BuildContext ctx) {
      Navigator.of(ctx)
          .pushNamed('/category-details', arguments: {'title': recipeTitle});
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
                  recipeTitle = ctgy.title;
                  selectCategory(context);
                },
                splashColor: ctgy.color,
                borderRadius: BorderRadius.circular(12),
                child: CategoryItem(ctgy));
          }).toList(),
        ));
  }
}
