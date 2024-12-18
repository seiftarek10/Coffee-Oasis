// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_item_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class OrderItemEntityAdapter extends TypeAdapter<OrderItemEntity> {
  @override
  final int typeId = 8;

  @override
  OrderItemEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return OrderItemEntity(
      id: fields[0] as String?,
      counter: fields[1] as int,
      price: fields[5] as num?,
      coffee: fields[2] as CoffeeEntity,
      isDelivery: fields[3] as bool?,
      isFinished: fields[4] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, OrderItemEntity obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.counter)
      ..writeByte(2)
      ..write(obj.coffee)
      ..writeByte(3)
      ..write(obj.isDelivery)
      ..writeByte(4)
      ..write(obj.isFinished)
      ..writeByte(5)
      ..write(obj.price);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OrderItemEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
