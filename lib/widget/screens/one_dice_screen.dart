import 'package:dicer/widget/dice/dice.dart';
import 'package:flutter/material.dart';

class OneDiceScreen extends StatelessWidget {
  const OneDiceScreen(
      {required this.number, required this.nextDiceIn, Key? key})
      : super(key: key);

  final int number;
  final int nextDiceIn;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Dice(
        number: number,
        sizeMultiplier: 0.7,
        bounceDuration: nextDiceIn,
      ),
    );
  }
}
