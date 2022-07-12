part of 'dice_cubit.dart';

@immutable
abstract class DiceState extends Equatable {
  const DiceState(this.numbers, this.nextDiceInMs);

  final List<int> numbers;
  final int nextDiceInMs;

  @override
  List<Object> get props => [numbers, nextDiceInMs];
}

class DiceInitial extends DiceState {
  DiceInitial() : super([RandomDice().value, RandomDice().value], 0);
}

class DiceRolled extends DiceState {
  const DiceRolled(super.numbers, super.nextDiceInMs);
}
