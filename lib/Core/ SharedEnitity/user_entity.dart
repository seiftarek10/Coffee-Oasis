class UserEntity {
  String? uid;
  String? email;
  String? password;
  String? userName;
  String? phoneNumber;
  String? address;

  UserEntity(
      [this.uid,
      this.email,
      this.password,
      this.userName,
      this.phoneNumber,
      this.address]);

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
