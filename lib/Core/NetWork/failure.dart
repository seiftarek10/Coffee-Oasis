import 'package:cloud_firestore/cloud_firestore.dart';

abstract class Failure {
  final String errMessage;

  Failure({required this.errMessage});
}

class FireBaseError extends Failure {
  FireBaseError({required super.errMessage});

  factory FireBaseError.firebaseException(FirebaseException excpetion) {
    switch (excpetion.code) {
      case 'permission-denied':
        return FireBaseError(
            errMessage: "You don't have permission to add a user.");

      case 'unavailable':
        return FireBaseError(
            errMessage: "The service is currently unavailable.");

      case 'invalid-argument':
        return FireBaseError(errMessage: "Invalid data provided.");

      default:
        return FireBaseError(errMessage: "Proccess Failed");
    }
  }
}
