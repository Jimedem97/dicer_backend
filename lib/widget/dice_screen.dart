import 'package:dicer/bloc/dice_cubit.dart';
import 'package:dicer/cube/two_cube_screen.dart';
import 'package:dicer/logic/server/server.dart';
import 'package:dicer/widget/dice/five.dart';
import 'package:dicer/widget/dice/one.dart';
import 'package:dicer/widget/screens/four_dices_screen.dart';
import 'package:dicer/widget/screens/one_dice_screen.dart';
import 'package:dicer/widget/screens/three_dices_screen.dart';
import 'package:dicer/widget/screens/two_dices_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DiceScreen extends StatefulWidget {
  const DiceScreen({Key? key}) : super(key: key);

  @override
  State<DiceScreen> createState() => _DiceScreenState();
}

class _DiceScreenState extends State<DiceScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DiceCubit, DiceState>(
      buildWhen: (previous, next) {
        return true;
      },
      builder: (context, state) {
        if (state.animation == "CUBE") {
          return const TwoCubeScreen();
        } else {
          switch (state.numbers.length) {
            case 1:
              return OneDiceScreen(
                  animation: state.animation,
                  number: state.numbers[0],
                  nextDiceIn: state.nextDiceInMs);
            case 2:
              return TwoDicesScreen(
                  animation: state.animation,
                  number1: state.numbers[0],
                  number2: state.numbers[1],
                  nextDiceIn: state.nextDiceInMs);
            case 3:
              return ThreeDicesScreen(
                  animation: state.animation,
                  number1: state.numbers[0],
                  number2: state.numbers[1],
                  number3: state.numbers[2],
                  nextDiceIn: state.nextDiceInMs);
            default:
              return FourDicesScreen(
                  animation: state.animation,
                  number1: state.numbers[0],
                  number2: state.numbers[1],
                  number3: state.numbers[2],
                  number4: state.numbers[3],
                  nextDiceIn: state.nextDiceInMs);
          }
        }
      },
    );
  }

// @override
// void initState() {
//   context.read<DiceCubit>().roll(100);
// }
}
