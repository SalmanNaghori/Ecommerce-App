// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

const String BASE_URL = "http://192.168.1.172:5000/api";
const Map<String, dynamic> Default_Header = {
  'Content-Type': 'application/json'
};

class Api {
  final Dio _dio = Dio();

  api() {
    _dio.options.baseUrl = BASE_URL;
    _dio.options.headers = Default_Header;
    _dio.interceptors.add(
      PrettyDioLogger(
          requestBody: true,
          requestHeader: true,
          responseBody: true,
          responseHeader: true),
    );
  }

  Dio get sendRequest => _dio;
}

class ApiResponse {
  bool success;
  dynamic data;
  String? message;

  ApiResponse({
    required this.success,
    this.data,
    this.message,
  });

  factory ApiResponse.fromResponse(Response response) {
    final data = response.data as Map<String, dynamic>;
    return ApiResponse(
        success: data["success"],
        data: data['data'],
        message: data["message"] ?? "unexpected error");
  }
}
