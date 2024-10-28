class UserEntity {
    String? email;
    String? password;
    String? userName;
    String? phoneNumber;
    String? address;

  UserEntity(
      [this.email,
      this.password,
      this.userName,
      this.phoneNumber,
      this.address]);

  toJson() {
    return {
      'userName': userName,
      'phoneNumber': phoneNumber,
      'Address': address
    };
  }
}
