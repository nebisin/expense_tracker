import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

part 'transaction.g.dart';

@HiveType(typeId: 2)
enum ActionType {
  @HiveField(0)
  expense,
  @HiveField(1)
  income,
}

@HiveType(typeId: 1)
class Transaction extends HiveObject {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final ActionType type;
  @HiveField(2)
  final String title;
  @HiveField(3)
  final double amount;
  @HiveField(4)
  final DateTime date;
  @HiveField(5)
  final String category;

  Transaction({
    @required this.id,
    @required this.type,
    this.title,
    @required this.amount,
    @required this.date,
    this.category,
  });
}
