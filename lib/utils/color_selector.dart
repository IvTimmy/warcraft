import 'package:flutter/material.dart';

class ColorSelector {
  ColorSelector._();

  static const List<MaterialColor> _colors = [
    Colors.blue,
    Colors.cyan,
    Colors.amber,
    Colors.deepOrange,
    Colors.deepPurple,
    Colors.green,
    Colors.pink,
    Colors.grey,
  ];

  static Color getColor(int index) => _colors[index % _colors.length];

  static int getColorsLength() => _colors.length;
}
