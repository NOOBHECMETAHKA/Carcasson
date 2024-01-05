// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'action_points_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ActionPointsAdapter extends TypeAdapter<ActionPoints> {
  @override
  final int typeId = 1;

  @override
  ActionPoints read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ActionPoints(
      fields[0] as DateTime,
      fields[1] as int,
      fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ActionPoints obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.createAt)
      ..writeByte(1)
      ..write(obj.countPoint)
      ..writeByte(2)
      ..write(obj.namePlayer);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ActionPointsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
