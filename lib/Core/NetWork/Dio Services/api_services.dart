import 'package:dio/dio.dart';

class ApiServices {
  final Dio dio;

  ApiServices({required this.dio});

  Future<dynamic> post(
      {required String endPoint,
      Map<String, String>? header,
      required Map<String, dynamic> body,
      String? contentType}) async {
    dio.options.headers = header ?? {};
    dio.options.contentType = contentType;
    var response = await dio.post(endPoint, data: body);
    return response.data();
  }
}
