import 'package:coffee_oasis/Features/Auth/Domain/Entity/user_entity.dart';

class UserModel extends UserEntity {
  final String? emailAddress;
  final String? userPassword;
  final String? userNamee;
  final String? phone;
  final String? userAddress;

  UserModel(this.emailAddress, this.userPassword, this.userNamee, this.phone,
      this.userAddress)
      : super(emailAddress, userPassword, userNamee, phone, userAddress);
}
