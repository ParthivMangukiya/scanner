import 'package:hive/hive.dart';

part 'pastresult.g.dart';

@HiveType(typeId: 1)
class PastResult {
  @HiveField(0)
  final String result;
  @HiveField(1)
  final DateTime scanTime;

  PastResult({required this.result, required this.scanTime});
}
