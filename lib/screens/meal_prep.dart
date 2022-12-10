import 'package:flutter/material.dart';

import '../widgets/appbar_style.dart';
import '../data.dart';

class MealPrep extends StatelessWidget {
  const MealPrep({super.key});
  static const routName = '/meal_prep';

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final routeAgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, Object>;

    final mealTitle = routeAgs['title'];
    final mealImage = routeAgs['image'];
    final mealId = routeAgs['id'];

    var mealItems = dummyMeals.firstWhere((item) => item.id == mealId);
    ;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(mediaQuery.size.height / 7),
        child: AppBar(
          elevation: 0.0,
          flexibleSpace: AppBarStyle(mealImage.toString()),
          title: const Text(
            'Meal Preparation',
            style: TextStyle(fontSize: 15),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 5, right: 5),
              padding: const EdgeInsets.only(top: 5, bottom: 5),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color.fromRGBO(230, 255, 72, 1),
              ),
              child: Text(
                mealTitle.toString(),
                textAlign: TextAlign.center,
                style: const TextStyle(color: Color.fromRGBO(39, 38, 38, 1)),
              ),
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: Text('Ingredients'),
                  ),
                  Container(
                      margin: const EdgeInsets.all(5),
                      padding: const EdgeInsets.all(8),
                      width: mediaQuery.size.width,
                      height: mediaQuery.size.height / 5,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color.fromRGBO(230, 255, 72, 0.1),
                          border: Border.all(
                            width: 0.5,
                            color: const Color.fromRGBO(230, 255, 72, 1),
                          )),
                      child: Scrollbar(
                        thickness: 5,
                        child: ListView.builder(
                          itemCount: mealItems.ingredients.length,
                          itemBuilder: (context, index) => Card(
                            color: const Color.fromRGBO(230, 255, 72, 0.5),
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text(
                                mealItems.ingredients[index],
                                style: const TextStyle(
                                    fontFamily: 'BebasNeue',
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                        ),
                      )),
                  const Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: Text('Steps'),
                  ),
                  Container(
                      margin: const EdgeInsets.all(5),
                      padding: const EdgeInsets.all(8),
                      width: mediaQuery.size.width,
                      height: mediaQuery.size.height / 2.2,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color.fromRGBO(115, 199, 73, 0.1),
                          border: Border.all(
                            width: 0.5,
                            color: const Color.fromRGBO(115, 199, 73, 1),
                          )),
                      child: Scrollbar(
                        thickness: 5,
                        child: ListView.builder(
                          itemCount: mealItems.steps.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                ListTile(
                                  leading: CircleAvatar(
                                    backgroundColor:
                                        const Color.fromRGBO(115, 199, 73, 1),
                                    child: Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Text(
                                        '#${index + 1}',
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'BebasNeue',
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                  ),
                                  title: Text(mealItems.steps[index],
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'BebasNeue',
                                          fontWeight: FontWeight.w400)),
                                ),
                                const Divider(
                                  color: Colors.grey,
                                ),
                              ],
                            );
                          },
                        ),
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
