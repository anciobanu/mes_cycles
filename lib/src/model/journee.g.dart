// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'journee.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class JourneeAdapter extends TypeAdapter<Journee> {
  @override
  final int typeId = 0;

  @override
  Journee read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Journee(
      fields[0] as DateTime,
      fields[1] as double,
      fields[2] as double,
      fields[3] as double,
      fields[4] as double,
      fields[5] as double,
      fields[6] as double,
      fields[7] as double,
      fields[8] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Journee obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.journee)
      ..writeByte(1)
      ..write(obj.flux)
      ..writeByte(2)
      ..write(obj.transit)
      ..writeByte(3)
      ..write(obj.ballonnements)
      ..writeByte(4)
      ..write(obj.jambesLourdes)
      ..writeByte(5)
      ..write(obj.forme)
      ..writeByte(6)
      ..write(obj.libido)
      ..writeByte(7)
      ..write(obj.stress)
      ..writeByte(8)
      ..write(obj.commentaires);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is JourneeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
