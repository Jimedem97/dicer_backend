import 'package:dicer/widget/dice/dice.dart';
import 'package:flutter/material.dart';

class OneDiceScreen extends StatelessWidget {
  const OneDiceScreen(
      {required this.number,
      required this.nextDiceIn,
      required this.animation,
      Key? key})
      : super(key: key);

  final int number;
  final int nextDiceIn;
  final String animation;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Dice(
        animation: animation,
        number: number,
        sizeMultiplier: 0.7,
        bounceDuration: nextDiceIn,
      ),
    );
  }
}
