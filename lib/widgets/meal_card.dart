import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:recase/recase.dart';

import '../models/meals.dart';
import '../screens/meal_prep.dart';

class MealCard extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  const MealCard(
      {required this.id,
      required this.title,
      required this.imageUrl,
      required this.duration,
      required this.affordability,
      required this.complexity,
      super.key});

  void selectMeal(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(MealPrep.routName, arguments: {
      'id': id,
      'title': title,
      'image': imageUrl,
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
        margin: const EdgeInsets.all(10),
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Column(
          children: [
            Stack(
              alignment: AlignmentDirectional.topStart,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                    height: 250,
                    width: double.infinity,
                  ),
                ),
                Positioned(
                    bottom: 20,
                    right: 10,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.black54,
                      ),
                      child: Text(
                        title,
                        style: const TextStyle(
                          fontFamily: 'baloo',
                        ),
                        softWrap: true,
                        overflow: TextOverflow.fade,
                      ),
                    ))
              ],
            ),
            ClipRRect(
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15)),
                child: SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      RichText(
                          text: TextSpan(children: [
                        const WidgetSpan(
                          child: Icon(
                            Icons.access_time,
                            color: Colors.grey,
                            size: 18,
                          ),
                        ),
                        const TextSpan(text: ' '),
                        TextSpan(
                            text: '$duration min',
                            style: const TextStyle(
                                color: Colors.grey, fontSize: 15))
                      ])),
                      RichText(
                          text: TextSpan(children: [
                        const WidgetSpan(
                          child: Icon(Icons.work, color: Colors.grey, size: 18),
                        ),
                        const TextSpan(text: ' '),
                        TextSpan(
                            text: toBeginningOfSentenceCase(complexity.name),
                            style: const TextStyle(
                                color: Colors.grey, fontSize: 15))
                      ])),
                      Flexible(
                        child: RichText(
                            text: TextSpan(children: [
                          const WidgetSpan(
                            child: Icon(Icons.monetization_on_outlined,
                                color: Colors.grey, size: 18),
                          ),
                          const TextSpan(text: ' '),
                          TextSpan(
                              text: ReCase(affordability.name).sentenceCase,
                              style: const TextStyle(
                                  color: Colors.grey, fontSize: 15))
                        ])),
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
