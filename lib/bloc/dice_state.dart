part of 'dice_cubit.dart';

@immutable
abstract class DiceState extends Equatable {
  const DiceState(this.numbers, this.nextDiceInMs, this.animation);

  final List<int> numbers;
  final int nextDiceInMs;
  final String animation;

  @override
  List<Object> get props => [numbers, nextDiceInMs, animation];
}

class DiceInitial extends DiceState {
  DiceInitial() : super([RandomDice().value, RandomDice().value], 0, "NONE");
}

class DiceRolled extends DiceState {
  const DiceRolled(super.numbers, super.nextDiceInMs, super.animation);
}
