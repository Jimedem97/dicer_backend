import 'package:flutter/material.dart';

class Dot extends StatelessWidget {
  const Dot(this.diceSize, {Key? key, this.color})
      : super(key: key);

  final double diceSize;
  final Color? color;

  factory Dot.empty(double diceSize){
    return Dot(diceSize);
  }

  factory Dot.white(double diceSize){
    return Dot(diceSize, color: Colors.white);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: diceSize * 0.2,
      height: diceSize * 0.2,
      decoration: BoxDecoration(shape: BoxShape.circle, color: color),
    );
  }
}
