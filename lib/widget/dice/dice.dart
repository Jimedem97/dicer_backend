import 'package:dicer/common/util.dart';
import 'package:dicer/widget/dice/dice_content.dart';
import 'package:dicer/widget/heartbeat.dart';
import 'package:flutter/material.dart';

class Dice extends StatelessWidget {
  const Dice(
      {required this.number,
      required this.sizeMultiplier,
      required this.bounceDuration,
      required this.animation,
      Key? key})
      : super(key: key);

  final int number;
  final double sizeMultiplier;
  final int bounceDuration;
  final String animation;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return Heartbeat(
      animation: animation,
      durationMs: bounceDuration ~/ 2,
      child: DiceContent(
          number: number, diceSize: diceSize(mediaQuery, sizeMultiplier)),
    );
  }
}
