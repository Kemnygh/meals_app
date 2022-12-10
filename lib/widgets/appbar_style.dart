import 'package:flutter/material.dart';

class AppBarStyle extends StatelessWidget {
  final String imageString;
  const AppBarStyle(this.imageString, {super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return Stack(children: [
      Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              imageString,
            ),
            opacity: 0.2,
            fit: BoxFit.cover,
          ),
        ),
      ),
      Container(
        height: mediaQuery.size.height / 5,
        width: double.infinity,
        decoration: const BoxDecoration(
          // color: Colors.black54,
          gradient: LinearGradient(
              colors: [
                Color.fromRGBO(39, 38, 38, 1),
                Colors.transparent,
              ],
              begin: Alignment(1, 0.9),
              end: Alignment(1, -0.1),
              stops: [0.1, 5],
              tileMode: TileMode.clamp),
        ),
      )
    ]);
  }
}
