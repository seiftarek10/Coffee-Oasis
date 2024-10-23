abstract class ValidationForm {

  static String? nullOrEpmty(String? value) {
    if (value == null || value.isEmpty) {
      return 'Required';
    }
    return null; 
  }


  static String? validEmail(String? email) {
    if (!RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
        .hasMatch(email ?? '')) {
      return 'Unvalid Email';
    }
    return null;
  }

  static String? validPhoneNumber(String? phoneNumber) {
    if (!RegExp(r'^(010|011|012|015)[0-9]{8}$').hasMatch(phoneNumber ?? '')) {
      return 'Enter Valid Number';
    }
    return null;
  }
}
