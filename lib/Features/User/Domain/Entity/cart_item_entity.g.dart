// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_item_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CartItemEntityAdapter extends TypeAdapter<CartItemEntity> {
  @override
  final int typeId = 8;

  @override
  CartItemEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CartItemEntity(
      id: fields[0] as String?,
      counter: fields[1] as int,
      coffee: fields[2] as CoffeeEntity,
    );
  }

  @override
  void write(BinaryWriter writer, CartItemEntity obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.counter)
      ..writeByte(2)
      ..write(obj.coffee);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CartItemEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
