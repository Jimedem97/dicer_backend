import 'dart:async';
import 'dart:math';

import 'package:dicer/bloc/dice_cubit.dart';
import 'package:dicer/cube/cube.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnimatedCube extends StatefulWidget {
  const AnimatedCube(
      {required this.index,
      required this.size,
        required this.initialOffset,
      Key? key})
      : super(key: key);

  final int index;
  final double size;
  final double initialOffset;

  @override
  State<AnimatedCube> createState() => _AnimatedCubeState();
}

bool isApprox(double value, double target, {double epsilon = 0.0001}) {
  return (value - target).abs() < epsilon;
}

class _AnimatedCubeState extends State<AnimatedCube> {
  static const int fps = 24;
  static const int callbackTimeout = 1000 ~/ fps;

  double _x = 0;
  Timer? _timer;
  bool isRunning = false;
  bool wasFinished = true;
  double stepSize = 0;
  int number1 = 1;
  int number2 = 2;
  int previousNumber1 = 1;
  int previousNumber2 = 1;

  bool canStop(int target) {
    return number1 == target && number2 == target;
  }

  void setNumbers(int newNumber) {
    if (isApprox(_x.abs(), pi / 2, epsilon: 0.1)) {
      number1 = newNumber;
    } else {
      previousNumber1 = number1;
      number1 = previousNumber1;
    }
    if (isApprox(_x.abs(), pi, epsilon: 0.1)) {
      number2 = newNumber;
    } else {
      previousNumber2 = number2;
      number2 = previousNumber2;
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  void initState() {
    _timer ??= Timer.periodic(
        const Duration(milliseconds: callbackTimeout), (_) => _onAnimate());

    super.initState();
  }

  bool sideCentered(double eps) {
    return (isApprox(_x, 0, epsilon: eps) ||
        isApprox(_x, pi, epsilon: eps) ||
        isApprox(_x, pi / 2, epsilon: eps) ||
        isApprox(_x, 1.5 * pi, epsilon: eps));
  }

  void _onAnimate() {
    if (isRunning || (!sideCentered(0.0001) && !isRunning)) {
      setState(() {
        if (sideCentered(0.01) && !isRunning) {
          _x = 0;
        } else {
          _x = (_x - pi + stepSize * pi / 180.0) % pi;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DiceCubit, DiceState>(builder: (context, state) {
      // if(wasFinished){
      //   _x = widget.initialOffset;
      // }
      isRunning = state is! DiceFinished;
      final number = state.numbers[widget.index];
      setNumbers(number);
      if (state is DiceFinished) {
        if (!sideCentered(0.1) && _x > 0 || !canStop(number)) {
          _x -= 0.01;
        } else {
          _x = 0;
          wasFinished = true;
        }
      } else {

        if (state.nextDiceInMs == 0) {
          stepSize = 0;
        } else {
          if(wasFinished){
            _x = widget.initialOffset;
            wasFinished = false;
          }
          stepSize = pi / (state.nextDiceInMs / 1000);
        }
      }


      return Cube(x: _x, size: widget.size, number1: number1, number2: number2);
    });
  }
}
