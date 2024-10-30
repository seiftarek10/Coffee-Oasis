// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coffee_drinks_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CoffeeDrinksHiveModelAdapter extends TypeAdapter<CoffeeDrinksHiveModel> {
  @override
  final int typeId = 3;

  @override
  CoffeeDrinksHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CoffeeDrinksHiveModel(
      id: fields[0] as String,
      coffeeDrinks: (fields[1] as List).cast<CoffeeEntity>(),
    );
  }

  @override
  void write(BinaryWriter writer, CoffeeDrinksHiveModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.coffeeDrinks);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CoffeeDrinksHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
