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
    return CoffeeEntity(
      id: fields[0] as String?,
      photo: fields[1] as String?,
      name: fields[2] as String?,
      description: fields[3] as String?,
      price: fields[4] as num?,
      category: fields[5] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, CoffeeEntity obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.photo)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.description)
      ..writeByte(4)
      ..write(obj.price)
      ..writeByte(5)
      ..write(obj.category);
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
