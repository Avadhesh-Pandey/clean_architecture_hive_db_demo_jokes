// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'jokes.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class JokesAdapter extends TypeAdapter<Jokes> {
  @override
  final int typeId = 1;

  @override
  Jokes read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Jokes(
      joke: fields[0] as String?,
      dateTime: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Jokes obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.joke)
      ..writeByte(1)
      ..write(obj.dateTime);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is JokesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
