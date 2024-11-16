// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shop_info_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ShopInfoEntityAdapter extends TypeAdapter<ShopInfoEntity> {
  @override
  final int typeId = 2;

  @override
  ShopInfoEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ShopInfoEntity(
      phoneNumber: fields[0] as String?,
      location: fields[1] as String?,
      startTime: fields[2] as String?,
      endTime: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, ShopInfoEntity obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.phoneNumber)
      ..writeByte(1)
      ..write(obj.location)
      ..writeByte(2)
      ..write(obj.startTime)
      ..writeByte(3)
      ..write(obj.endTime);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ShopInfoEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
