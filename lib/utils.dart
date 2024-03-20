import 'package:flutter/material.dart';

List<Color> getColor(int? id) {
  switch (id) {
    case 0:
      return const [
        Colors.yellowAccent,
        Color.fromARGB(255, 240, 218, 21),
      ];
    case 1:
      return const [
        Color.fromARGB(255, 110, 252, 183),
        Color.fromARGB(255, 6, 157, 11)
      ];
    case 2:
      return const [
        Color.fromARGB(255, 255, 96, 96),
        Color.fromARGB(255, 219, 21, 7)
      ];
    default:
      return [const Color.fromARGB(255, 218, 218, 218), Colors.grey];
  }
}
