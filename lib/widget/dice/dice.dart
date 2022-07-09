import 'dart:math';

import 'package:dicer/common/extensions/int_extensions.dart';
import 'package:flutter/material.dart';

class Dice extends StatelessWidget {
  const Dice({required this.number, required this.sizeMultiplier, Key? key})
      : super(key: key);

  final int number;
  final double sizeMultiplier;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final diceSize = min(mediaQuery.size.height, mediaQuery.size.width) * sizeMultiplier;
    return Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(64)),
        width: diceSize,
        height: diceSize,
        child: number.toDiceWidget(diceSize));
  }
}
