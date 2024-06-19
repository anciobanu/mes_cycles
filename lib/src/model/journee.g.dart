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
      fields[1] as String?,
      fields[2] as double,
      fields[3] as double,
      fields[4] as double,
      fields[5] as double,
      fields[6] as double,
      fields[7] as double,
      fields[8] as double,
      fields[9] as double,
    );
  }

  @override
  void write(BinaryWriter writer, Journee obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.journee)
      ..writeByte(1)
      ..write(obj.commentaires)
      ..writeByte(2)
      ..write(obj.flux)
      ..writeByte(3)
      ..write(obj.transit)
      ..writeByte(4)
      ..write(obj.ballonnements)
      ..writeByte(5)
      ..write(obj.douleurs)
      ..writeByte(6)
      ..write(obj.jambesLourdes)
      ..writeByte(7)
      ..write(obj.forme)
      ..writeByte(8)
      ..write(obj.libido)
      ..writeByte(9)
      ..write(obj.stress);
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
