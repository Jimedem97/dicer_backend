import 'package:dicer/widget/dice/dice.dart';
import 'package:flutter/material.dart';

class ThreeDicesScreen extends StatelessWidget {
  const ThreeDicesScreen(
      {required this.number1,
      required this.number2,
      required this.number3,
      required this.nextDiceIn,
      Key? key})
      : super(key: key);

  final int number1;
  final int number2;
  final int number3;
  final int nextDiceIn;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Dice(
                number: number1,
                sizeMultiplier: 0.4,
                bounceDuration: nextDiceIn),
            Dice(
                number: number2,
                sizeMultiplier: 0.4,
                bounceDuration: nextDiceIn)
          ]),
          Dice(number: number3, sizeMultiplier: 0.4, bounceDuration: nextDiceIn)
        ],
      ),
    );
  }
}
