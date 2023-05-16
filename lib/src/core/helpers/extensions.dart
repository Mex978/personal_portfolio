import 'package:flutter/material.dart';

extension BuildContextExtensions on BuildContext {
  double percentHeight(double percentage) {
    final currentHeight = MediaQuery.of(this).size.height;
    return currentHeight * percentage;
  }

  double percentWidth(double percentage) {
    final currentWidth = MediaQuery.of(this).size.width;
    return currentWidth * percentage;
  }

  ColorScheme get colorScheme => Theme.of(this).colorScheme;
  TextTheme get textTheme => Theme.of(this).textTheme;
}
