import 'package:dicer/common/extensions/int_extensions.dart';
import 'package:flutter/material.dart';

class DiceContent extends StatelessWidget {
  const DiceContent({required this.number, required this.diceSize, Key? key})
      : super(key: key);

  final int number;
  final double diceSize;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(64)),
        width: diceSize,
        height: diceSize,
        child: number.toDiceWidget(diceSize));
  }
}
