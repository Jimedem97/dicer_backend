part of 'dice_cubit.dart';

@immutable
abstract class DiceState extends Equatable {
  DiceState(this.numbers, this.nextDiceInMs, this.animation);

  final List<int> numbers;
  final int nextDiceInMs;
  final String animation;
  final UniqueKey uniqueId = UniqueKey();

  @override
  List<Object> get props => [numbers, nextDiceInMs, animation, uniqueId];
}

class DiceInitial extends DiceState {
  DiceInitial()
      : super([RandomDice().value, RandomDice().value], 0, "NONE");
}

class DiceRolled extends DiceState {
  DiceRolled(
      super.numbers, super.nextDiceInMs, super.animation);
}

class DiceFinished extends DiceState{
  DiceFinished(
      super.numbers, super.nextDiceInMs, super.animation);
}
