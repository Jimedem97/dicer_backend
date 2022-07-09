import 'package:dicer/common/random_dice.dart';

class StartDto {
  final double initialTickDurationMS;
  final int percentTickIncrease;
  final int lastTickMS;
  List<int> targets;

  StartDto(
      {this.initialTickDurationMS = 100,
      this.percentTickIncrease = 10,
      this.lastTickMS = 1000,
      this.targets = const [1, 1]});

  factory StartDto.fromJson(Map<String, dynamic> json) {
    return StartDto(
        initialTickDurationMS: json['initialTickDurationMS'] ?? 100,
        percentTickIncrease: json['percentTickIncrease'] ?? 10,
        lastTickMS: json['lastTickMS'] ?? 1000,
        targets: _toIntListOrDefault(json['targets']));
  }

  static List<int> _toIntListOrDefault(List<dynamic>? list) {
    final intList = list?.map((e) => e as int).toList() ?? List.empty();
    if (intList.isEmpty || intList.length > 4) {
      return [RandomDice().value, RandomDice().value];
    } else {
      return intList;
    }
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StartDto &&
          runtimeType == other.runtimeType &&
          initialTickDurationMS == other.initialTickDurationMS &&
          percentTickIncrease == other.percentTickIncrease &&
          lastTickMS == other.lastTickMS &&
          targets == other.targets;

  @override
  int get hashCode =>
      initialTickDurationMS.hashCode ^
      percentTickIncrease.hashCode ^
      lastTickMS.hashCode ^
      targets.hashCode;

  @override
  String toString() {
    return 'StartDto{initialTickDurationMS: $initialTickDurationMS, percentTickIncrease: $percentTickIncrease, lastTickMS: $lastTickMS, targets: $targets}';
  }
}
