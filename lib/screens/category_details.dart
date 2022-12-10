import 'package:flutter/material.dart';
import '../widgets/meal_card.dart';

import '../data.dart';

class CategoryDetails extends StatelessWidget {
  // final String title;
  const CategoryDetails({super.key});

  static const routeName = '/category-details';
  @override
  Widget build(BuildContext context) {
    final routeAgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, Object>;

    final catgTitle = routeAgs['title'];
    final catgId = routeAgs['id'];

    final catgMeals = dummyMeals
        .where((element) => element.categories.contains(catgId))
        .toList();

    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          title: Text('$catgTitle Styles'),
        ),
        body: ListView.builder(
          itemCount: catgMeals.length,
          itemBuilder: ((context, index) {
            return MealCard(
                id: catgMeals[index].id,
                title: catgMeals[index].title,
                imageUrl: catgMeals[index].imageUrl,
                duration: catgMeals[index].duration,
                affordability: catgMeals[index].affordability,
                complexity: catgMeals[index].complexity);
          }),
        ));
  }
}
