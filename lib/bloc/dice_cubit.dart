import 'dart:math';

import 'package:dicer/common/random_dice.dart';
import 'package:dicer/dto/config_dto.dart';
import 'package:dicer/logic/server/listeners/auto_run_listener.dart';
import 'package:dicer/logic/server/listeners/config_listener.dart';
import 'package:dicer/logic/server/listeners/start_listener.dart';
import 'package:dicer/logic/server/listeners/stop_listener.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../logic/server/server.dart';

part 'dice_state.dart';

class DiceCubit extends Cubit<DiceState>
    implements
        DicerAutorunListener,
        DicerStartListener,
        DicerStopListener,
        DicerConfigListener {
  DiceCubit() : super(DiceInitial()) {
    _autoRunListener = DicerServerAutorunListener(this);
    Server.instance.registerListener(_autoRunListener);
    _startListener = DicerServerStartListener(this);
    Server.instance.registerListener(_startListener);
    _stopListener = DicerServerStopListener(this);
    Server.instance.registerListener(_stopListener);
    _configListener = DicerServerConfigListener(this);
    Server.instance.registerListener(_configListener);
  }

  late final DicerServerAutorunListener _autoRunListener;
  late final DicerServerStartListener _startListener;
  late final DicerServerStopListener _stopListener;
  late final DicerServerConfigListener _configListener;
  final random = Random();

  bool _stopped = false;
  bool _started = false;

  ConfigDto _config = ConfigDto();

  var _run = 0;

  void emitRandomDices(int amount, int nexDiceIn, String animation) {
    final numbers = List.generate(amount, (_) => RandomDice().value);
    emit(DiceRolled(numbers, nexDiceIn, animation));
  }

  @override
  void onStartAutorunReceived(ConfigDto dto) async {
    var tickDuration = dto.initialTickDurationMS;
    while (tickDuration < dto.lastTickMS) {
      emitRandomDices(dto.targets.length, tickDuration.toInt(), dto.animation);
      await Future.delayed(Duration(milliseconds: tickDuration.toInt()));
      tickDuration *= (1 + (dto.percentTickIncrease / 100.0));
    }
    emit(DiceRolled(dto.targets[_run % dto.targets.length], 0, dto.animation));
    _run++;
  }

  @override
  void onStopReceived() {
    if (_started) {
      _stopped = true;
    }
  }

  @override
  void onStartReceived() async {
    _started = true;
    var tickDuration = _config.initialTickDurationMS;
    while (tickDuration < _config.lastTickMS) {
      emitRandomDices(
          _config.targets.length, tickDuration.toInt(), _config.animation);
      await Future.delayed(Duration(milliseconds: tickDuration.toInt()));
      if (_stopped) {
        tickDuration *= (1 + (_config.percentTickIncrease / 100.0));
      }
    }
    emit(DiceRolled(
        _config.targets[_run % _config.targets.length], 0, _config.animation));
    _run++;
    _stopped = false;
    _started = false;
  }

  @override
  bool onConfigReceived(ConfigDto dto) {
    if (!_started) {
      _config = dto;
      return true;
    } else {
      return false;
    }
  }
}
