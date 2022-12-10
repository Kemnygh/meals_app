import 'package:flutter/material.dart';
import 'package:meals_app/models/category_model.dart';

class CategoryItem extends StatelessWidget {
  final Category ctgy;
  const CategoryItem(this.ctgy, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 5, right: 5),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(ctgy.image),
          fit: BoxFit.cover,
          opacity: 0.8,
        ),
        color: const Color.fromRGBO(95, 95, 93, 0.294),
        backgroundBlendMode: BlendMode.difference,
        gradient: LinearGradient(
            colors: [
              ctgy.color,
              const Color.fromRGBO(67, 77, 80, 0.5),
            ],
            begin: const Alignment(0.0, -3.0),
            end: const Alignment(2.0, 2.0),
            stops: const [0.1, 0.5],
            tileMode: TileMode.clamp),
        border: Border.all(
          width: 0.5,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
          child: Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                  color: ctgy.color.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(10)),
              child: Text(ctgy.title))),
    );
  }
}
