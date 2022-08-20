import 'dart:math';

import 'package:dicer/common/util.dart';
import 'package:dicer/cube/animated_cube.dart';
import 'package:flutter/material.dart';

class TwoCubeScreen extends StatelessWidget {
  const TwoCubeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double size = diceSize(MediaQuery.of(context), 0.6);
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          AnimatedCube(index: 0, size: size),
          AnimatedCube(index: 1, size: size),
        ],
      ),
    );
  }
}
