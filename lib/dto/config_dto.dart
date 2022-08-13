import 'package:dicer/common/random_dice.dart';

class ConfigDto {
  final double initialTickDurationMS;
  final int percentTickIncrease;
  final int lastTickMS;
  List<List<int>> targets;
  final String animation;

  ConfigDto(
      {this.initialTickDurationMS = 100,
      this.percentTickIncrease = 10,
      this.lastTickMS = 1000,
      this.targets = const [[1, 1]],
      this.animation = ''});

  factory ConfigDto.fromJson(Map<String, dynamic> json) {
    return ConfigDto(
        initialTickDurationMS: json['initialTickDurationMs'] ?? 300,
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
          initialTickDurationMS == other.initialTickDurationMS &&
          percentTickIncrease == other.percentTickIncrease &&
          lastTickMS == other.lastTickMS &&
          targets == other.targets &&
          animation == other.animation;

  @override
  int get hashCode =>
      initialTickDurationMS.hashCode ^
      percentTickIncrease.hashCode ^
      lastTickMS.hashCode ^
      targets.hashCode ^
      animation.hashCode;

  @override
  String toString() {
    return 'StartDto{initialTickDurationMS: $initialTickDurationMS, percentTickIncrease: $percentTickIncrease, lastTickMS: $lastTickMS, targets: $targets, animation: $animation}';
  }
}
