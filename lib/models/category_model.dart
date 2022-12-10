import 'package:flutter/material.dart';

class Category {
  final String id;
  final String title;
  final String image;
  final Color color;

  const Category(
      {required this.id,
      required this.title,
      this.image = 'assets/images/default.png',
      this.color = const Color.fromRGBO(199, 191, 191, 0.774)});
}
