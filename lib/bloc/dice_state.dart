part of 'dice_cubit.dart';

@immutable
abstract class DiceState extends Equatable {
  const DiceState(this.numbers);

  final List<int> numbers;

  @override
  List<Object> get props => [numbers];
}

class DiceInitial extends DiceState {
  DiceInitial() : super([RandomDice().value, RandomDice().value]);
}

class DiceRolled extends DiceState {
  const DiceRolled(super.numbers);
}
