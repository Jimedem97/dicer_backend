import 'package:dicer/widget/dice/dot.dart';
import 'package:flutter/material.dart';

class Two extends StatelessWidget {
  const Two(this.diceSize, {Key? key}) : super(key: key);

  final double diceSize;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Dot.white(diceSize),
            const SizedBox(height: 16),
            Dot.empty(diceSize),
            const SizedBox(height: 16),
            Dot.empty(diceSize),
          ],
        ),
        const SizedBox(width: 32),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Dot.empty(diceSize),
            const SizedBox(height: 16),
            Dot.empty(diceSize),
            const SizedBox(height: 16),
            Dot.empty(diceSize),
          ],
        ),
        const SizedBox(width: 32),
        Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Dot.empty(diceSize),
          const SizedBox(height: 16),
          Dot.empty(diceSize),
          const SizedBox(height: 16),
          Dot.white(diceSize)
        ])
      ],
    ));
  }
}
