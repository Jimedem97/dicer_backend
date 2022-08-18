import 'package:dicer/cube/legacy/cube_page_view.dart';
import 'package:dicer/widget/dice/dice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/dice_cubit.dart';

class DiceTestScreen extends StatelessWidget {
  DiceTestScreen({Key? key}) : super(key: key);

  final PageController _pageController = PageController();
  List<int> list = [];
  var page = 0;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 0.7;
    return BlocBuilder<DiceCubit, DiceState>(
      builder: (context, state) {
        list.add(state.numbers[0]);
        if (_pageController.hasClients) {
          _pageController.nextPage(
              duration: Duration(milliseconds: state.nextDiceInMs - 10),
              curve: Curves.easeIn);
        }

        return Center(
          child: SizedBox(
            height: height,
            width: height,
            child: CubePageView.builder(
              controller: _pageController,
              scrollDirection: Axis.vertical,
              itemCount: list.length,
              itemBuilder: (context, index, notifier, scrollDirection) {
                return CubeWidget(
                    index: index,
                    pageNotifier: notifier,
                    rotationDirection: scrollDirection,
                    child: Dice(
                        number: list[index],
                        sizeMultiplier: 0.4,
                        bounceDuration: 0,
                        animation: "None"));
              },
            ),
          ),
        );
      },
    );
  }
}
