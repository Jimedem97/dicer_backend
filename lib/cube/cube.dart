import 'package:dicer/cube/side.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class Cube extends StatelessWidget {
  const Cube({
    Key? key,
    required this.x,
    required this.size,
    required this.number1,
    required this.number2,
    this.y = 0,
  }) : super(key: key);

  final double x, y, size;

  double get _sum => (y + (x > pi ? pi : 0.0)).abs() % (pi * 2);

  final int number1;
  final int number2;

  @override
  Widget build(BuildContext context) {
    final bool topBottom = x < pi / 2 || x > 1.5 * pi;
    final bool northSouth = _sum < pi / 2 || _sum > 1.5 * pi;
    final bool eastWest = _sum < pi;
    return Stack(children: <Widget>[
      Side(
        number: number1,
        moveZ: !topBottom,
        size: size,
        xRot: topBottom ? -x : pi + x,
      ),
      Side(
        number: number2,
        moveZ: !northSouth,
        size: size,
        xRot: pi / 2 - x,
      ),
      Side(
        number: 0,
        moveZ: eastWest,
        size: size,
        yRot: -pi / 2 + y,
        xRot: pi / 2 - x,
      )
    ]);
  }
}
