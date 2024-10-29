// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coffee_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CoffeeEntityAdapter extends TypeAdapter<CoffeeEntity> {
  @override
  final int typeId = 1;

  @override
  CoffeeEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CoffeeEntity();
  }

  @override
  void write(BinaryWriter writer, CoffeeEntity obj) {
    writer.writeByte(0);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CoffeeEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
