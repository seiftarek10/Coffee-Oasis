import 'package:hive_flutter/adapters.dart';

class HiveServices<T> {
  final String boxName;

  HiveServices({required this.boxName});

  Future<void> saveData(List<T> data) async {
    var box = await Hive.openBox<T>(boxName);
    await box.addAll(data);
  }

  Future<List<T>> getData() async {
    var box = await Hive.openBox<T>(boxName);
    return box.values.toList();
  }


  Future<void> clear() async {
    var box = await Hive.openBox<T>(boxName);
    await box.clear();
  }

  Future<void> saveListWithKey(
      {required String categoryKey, required List<T> coffee}) async {
    var box = await Hive.openBox<List<T>>(boxName);
    await box.put(categoryKey, coffee);
  }

  Future<List<T>?> getByKey({required String dataKey}) async {
    var box = await Hive.openBox<List<T>>(boxName);
    return box.get(dataKey);
  }
}
