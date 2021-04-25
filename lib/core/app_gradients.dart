import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class AppGradients {
  static final linear = LinearGradient(colors: [
    Color(0xFF1E1E1E),
    Color.fromRGBO(43, 98, 2, 0.9),
  ], stops: [
    0.0,
    0.695
  ], transform: GradientRotation(2.13959913 * pi));
}

class AppGradientsCard {
  static final linear = LinearGradient(colors: [
    Color.fromRGBO(255, 255, 255, 1),
    Color.fromRGBO(226, 255, 237, 1),
  ], stops: [
    0.0,
    0.695
  ], transform: GradientRotation(2.13959913 * pi));
}
