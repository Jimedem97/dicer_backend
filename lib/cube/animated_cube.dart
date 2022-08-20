import 'dart:async';
import 'dart:math';

import 'package:dicer/bloc/dice_cubit.dart';
import 'package:dicer/cube/cube.dart';
import 'package:dicer/widget/dice/dice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnimatedCube extends StatefulWidget {
  const AnimatedCube({required this.index, required this.size, Key? key})
      : super(key: key);

  final int index;
  final double size;

  @override
  State<AnimatedCube> createState() => _AnimatedCubeState();
}

bool isApprox(double value, double target, {double epsilon = 0.0001}) {
  return (value - target).abs() < epsilon;
}

class _AnimatedCubeState extends State<AnimatedCube>
    with TickerProviderStateMixin {
  late Animation<double> _animation;
  double _x = 0;
  int number1 = 1;
  int number2 = 2;
  int previousNumber1 = 1;
  int previousNumber2 = 1;
  double stepSize = 0;
  late AnimationController _controller = AnimationController(vsync: this);

  bool canStop(int target) {
    return number1 == target && number2 == target;
  }

  void setNumbers(int newNumber) {
    if (isApprox(_x.abs(), pi / 2, epsilon: stepSize)) {
      number1 = newNumber;
    } else {
      previousNumber1 = number1;
    }
    if (isApprox(_x.abs(), 0, epsilon: stepSize)) {
      number2 = newNumber;
    } else {
      previousNumber2 = number2;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DiceCubit, DiceState>(builder: (context, state) {
      final number = state.numbers[widget.index];

      if (_controller.isCompleted && state is DiceRolled ||
          (_controller.isCompleted &&
              state is DiceFinished &&
              !canStop(number)) ||
          (!_controller.isAnimating && state is DiceRolled)) {
        _controller.dispose();
        _controller = AnimationController(
            vsync: this, duration: Duration(milliseconds: state.nextDiceInMs));
        _animation = Tween<double>(begin: 0, end: pi / 2).animate(_controller);
        _controller.forward();
        _animation.addListener(() {
          setState(() {
            stepSize = (_x - _animation.value).abs();
            _x = _animation.value;
            setNumbers(number);
          });
        });
      }

      return Cube(x: _x, size: widget.size, number1: number1, number2: number2);
    });
  }
}
