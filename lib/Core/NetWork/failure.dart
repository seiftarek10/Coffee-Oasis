import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';

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

class DioFailure extends Failure {
  DioFailure({required super.errMessage});

  factory DioFailure.fromDioException(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return DioFailure(errMessage: 'Connection Timeout');
      case DioExceptionType.sendTimeout:
        return DioFailure(errMessage: 'Send Timeout');
      case DioExceptionType.receiveTimeout:
        return DioFailure(errMessage: 'Receive Timeout');
      case DioExceptionType.badCertificate:
        return DioFailure(errMessage: 'Bad Certificate');
      case DioExceptionType.badResponse:
        return DioFailure(
          errMessage:
              'Bad Response: ${error.response?.statusCode} - ${error.response?.statusMessage ?? 'Unknown error'}',
        );
      case DioExceptionType.cancel:
        return DioFailure(errMessage: 'Request Cancelled');
      case DioExceptionType.connectionError:
        return DioFailure(
            errMessage:
                'Connection Error: Please check your internet connection');
      case DioExceptionType.unknown:
        return DioFailure(
          errMessage:
              'Unknown Error: ${error.message ?? 'An unexpected error occurred'}',
        );
      default:
        return DioFailure(errMessage: 'Unexpected Error');
    }
  }
}
