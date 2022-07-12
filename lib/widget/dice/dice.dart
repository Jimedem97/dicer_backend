import 'dart:math';

import 'package:dicer/widget/dice/dice_content.dart';
import 'package:dicer/widget/heartbeat.dart';
import 'package:flutter/material.dart';

class Dice extends StatelessWidget {
  const Dice(
      {required this.number,
      required this.sizeMultiplier,
      required this.bounceDuration,
      Key? key})
      : super(key: key);

  final int number;
  final double sizeMultiplier;
  final int bounceDuration;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    final diceSize =
        min(mediaQuery.size.height, mediaQuery.size.width) * sizeMultiplier;
    return Heartbeat(
      durationMs: bounceDuration ~/ 2,
      child: DiceContent(number: number, diceSize: diceSize),
    );
  }
}
