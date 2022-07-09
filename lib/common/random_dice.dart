import 'dart:math';

class RandomDice {
  static final Random _random = Random();

  final value = _random.nextInt(6) + 1;
}
