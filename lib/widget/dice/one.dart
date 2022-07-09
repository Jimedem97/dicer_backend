import 'package:dicer/widget/dice/dot.dart';
import 'package:flutter/material.dart';

class One extends StatelessWidget {
  const One(this.diceSize, {Key? key}) : super(key: key);

  final double diceSize;

  @override
  Widget build(BuildContext context) {
    return Center(child: Dot.white(diceSize));
  }
}
