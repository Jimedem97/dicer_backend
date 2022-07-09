import 'package:dicer/common/extensions/int_extensions.dart';
import 'package:dicer/widget/dice/dice.dart';
import 'package:flutter/material.dart';

class TwoDicesScreen extends StatelessWidget {
  const TwoDicesScreen({required this.number1, required this.number2, Key? key})
      : super(key: key);

  final int number1;
  final int number2;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [Dice(number: number1, sizeMultiplier: 0.7,), Dice(number: number2, sizeMultiplier: 0.7,)],
      ),
    );
  }
}
