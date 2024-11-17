import 'package:hive_flutter/hive_flutter.dart';

class HiveServices<T> {
  final String boxName;

  HiveServices({required this.boxName});

  Future<void> clearBox() async {
    Box<T> box = Hive.box<T>(boxName);
    await box.clear();
  }

  Future<void> saveData(List<T> data) async {
    Box<T> box = Hive.box<T>(boxName);
    await clearBox();
    await box.addAll(data);
  }

  List<T> getData() {
    Box<T> box = Hive.box<T>(boxName);
    return box.values.toList();
  }

  Future<void> saveWithKey(
      {required T object, required String objectKey}) async {
    Box<T> box = Hive.box<T>(boxName);
    await box.put(objectKey, object);
  }

  T? getByKey({required String? objectKey}) {
    Box<T> box = Hive.box<T>(boxName);
    if (!box.containsKey(objectKey)) {
      return null;
    }
    return box.get(objectKey);
  }
}
