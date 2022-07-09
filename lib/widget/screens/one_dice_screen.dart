import 'package:dicer/common/extensions/int_extensions.dart';
import 'package:dicer/widget/dice/dice.dart';
import 'package:flutter/material.dart';

class OneDiceScreen extends StatelessWidget {
  const OneDiceScreen({required this.number, Key? key}) : super(key: key);

  final int number;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Dice(number: number, sizeMultiplier: 0.7,),
    );
  }
}
