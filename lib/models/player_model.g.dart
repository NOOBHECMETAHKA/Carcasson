// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UnitPlayerAdapter extends TypeAdapter<UnitPlayer> {
  @override
  final int typeId = 0;

  @override
  UnitPlayer read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UnitPlayer(
      fields[0] as String,
      fields[1] as int,
      image: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, UnitPlayer obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.point)
      ..writeByte(2)
      ..write(obj.image);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UnitPlayerAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
