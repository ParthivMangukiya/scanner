// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pastresult.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PastResultAdapter extends TypeAdapter<PastResult> {
  @override
  final int typeId = 1;

  @override
  PastResult read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PastResult(
      result: fields[0] as String,
      scanTime: fields[1] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, PastResult obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.result)
      ..writeByte(1)
      ..write(obj.scanTime);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PastResultAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
