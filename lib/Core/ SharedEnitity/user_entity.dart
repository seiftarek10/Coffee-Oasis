import 'package:hive_flutter/adapters.dart';

part 'user_entity.g.dart';

@HiveType(typeId: 4)
class UserEntity extends HiveObject {
  @HiveField(0)
  String? uid;
  @HiveField(1)
  String? email;
  String? password;
  @HiveField(2)
  String? userName;
  @HiveField(3)
  String? phoneNumber;
  @HiveField(4)
  String? address;

  UserEntity(
      {this.uid,
      this.email,
      this.password,
      this.userName,
      this.phoneNumber,
      this.address});

  toJson() {
    return {
      'uid': uid,
      'email': email,
      'userName': userName,
      'phoneNumber': phoneNumber,
      'Address': address
    };
  }
}
