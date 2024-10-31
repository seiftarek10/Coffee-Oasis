import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee_oasis/Core/%20SharedEnitity/user_entity.dart';

class UserModel extends UserEntity {
  final String? userid;
  final String? emailAddress;
  final String? userPassword;
  final String? userNamee;
  final String? phone;
  final String? userAddress;

  UserModel(this.userid, this.emailAddress, this.userPassword, this.userNamee,
      this.phone, this.userAddress)
      : super(
          uid: userid,
          email: emailAddress,
          userName: userNamee,
          password: userPassword,
          phoneNumber: phone,
          address: userAddress,
        );
  factory UserModel.fromJson(DocumentSnapshot<Map<String, dynamic>?> json) {
    return UserModel(
        json.data()?['uid'],
        json.data()?['email'],
        null,
        json.data()?['userName'],
        json.data()?['phoneNumber'],
        json.data()?['Address']);
  }
}
