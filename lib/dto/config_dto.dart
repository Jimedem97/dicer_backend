import 'package:dicer/common/random_dice.dart';

class ConfigDto {
  final int initialTickDurationMs;
  final int percentTickIncrease;
  final int lastTickMS;
  List<List<int>> targets;
  final String animation;

  ConfigDto(
      {this.initialTickDurationMs = 300,
      this.percentTickIncrease = 10,
      this.lastTickMS = 1000,
      this.targets = const [[2, 3]],
      this.animation = ''});

  factory ConfigDto.fromJson(Map<String, dynamic> json) {
    return ConfigDto(
        initialTickDurationMs: json['initialTickDurationMs'] ?? 300,
        percentTickIncrease: json['percentTickIncrease'] ?? 5,
        lastTickMS: json['lastTickMs'] ?? 1000,
        targets: _toTargetListOrDefault(json['targets']),
        animation: json['animation'] ?? '');
  }

  static List<int> _toIntListOrDefault(List<dynamic>? list) {
    final intList = list?.map((e) => e as int).toList() ?? List.empty();
    if (intList.isEmpty || intList.length > 4) {
      return [RandomDice().value, RandomDice().value];
    } else {
      return intList;
    }
  }

  static List<List<int>> _toTargetListOrDefault(List<dynamic>? list){
    final targetList = list?.map((e) => e as List<dynamic>).toList() ?? List.empty();
    return targetList.map((e) => _toIntListOrDefault(e)).toList();
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ConfigDto &&
          runtimeType == other.runtimeType &&
          initialTickDurationMs == other.initialTickDurationMs &&
          percentTickIncrease == other.percentTickIncrease &&
          lastTickMS == other.lastTickMS &&
          targets == other.targets &&
          animation == other.animation;

  @override
  int get hashCode =>
      initialTickDurationMs.hashCode ^
      percentTickIncrease.hashCode ^
      lastTickMS.hashCode ^
      targets.hashCode ^
      animation.hashCode;

  @override
  String toString() {
    return 'StartDto{initialTickDurationMS: $initialTickDurationMs, percentTickIncrease: $percentTickIncrease, lastTickMS: $lastTickMS, targets: $targets, animation: $animation}';
  }
}
