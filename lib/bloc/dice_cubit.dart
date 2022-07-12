import 'dart:math';

import 'package:dicer/common/random_dice.dart';
import 'package:dicer/dto/start_dto.dart';
import 'package:dicer/logic/server/listeners/start_listener.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../logic/server/server.dart';

part 'dice_state.dart';

class DiceCubit extends Cubit<DiceState> implements DicerStartListener {
  DiceCubit() : super(DiceInitial()) {
    _listener = DicerServerStartListener(this);
    Server.instance.registerListener(_listener);
  }

  late final DicerServerStartListener _listener;
  final random = Random();

  void emitRandomDices(int amount, int nexDiceIn) {
    final numbers = List.generate(amount, (_) => RandomDice().value);
    emit(DiceRolled(numbers, nexDiceIn));
  }

  @override
  void onStartReceived(StartDto dto) async {
    var tickDuration = dto.initialTickDurationMS;
    while (tickDuration < dto.lastTickMS) {
      emitRandomDices(dto.targets.length, tickDuration.toInt());
      await Future.delayed(Duration(milliseconds: tickDuration.toInt()));
      tickDuration *= (1 + (dto.percentTickIncrease / 100.0));
      // tickDuration *= (1);
    }
    emit(DiceRolled(dto.targets, 0));
  }
}
