// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ActionTypeAdapter extends TypeAdapter<ActionType?> {
  @override
  final int typeId = 2;

  @override
  ActionType? read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return ActionType.expense;
      case 1:
        return ActionType.income;
      default:
        return null;
    }
  }

  @override
  void write(BinaryWriter writer, ActionType? obj) {
    switch (obj!) {
      case ActionType.expense:
        writer.writeByte(0);
        break;
      case ActionType.income:
        writer.writeByte(1);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ActionTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class TransactionAdapter extends TypeAdapter<Transaction> {
  @override
  final int typeId = 1;

  @override
  Transaction read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Transaction(
      id: fields[0] as String,
      type: fields[1] as ActionType,
      title: fields[2] as String?,
      amount: fields[3] as double,
      date: fields[4] as DateTime,
      category: fields[5] as String?,
      isFavorite: fields[6] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, Transaction obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.type)
      ..writeByte(2)
      ..write(obj.title)
      ..writeByte(3)
      ..write(obj.amount)
      ..writeByte(4)
      ..write(obj.date)
      ..writeByte(5)
      ..write(obj.category)
      ..writeByte(6)
      ..write(obj.isFavorite);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TransactionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
