import 'package:flutter/material.dart';

Color getColor(int? id) {
  switch (id) {
    case 0:
      return const Color.fromARGB(255, 121, 250, 126);
    case 1:
      return const Color.fromARGB(255, 12, 145, 17);
    case 2:
      return const Color.fromARGB(255, 208, 30, 17);
    default:
      return Colors.grey;
  }
}
