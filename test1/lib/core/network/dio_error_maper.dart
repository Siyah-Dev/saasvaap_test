import 'package:dio/dio.dart';

String mapDioError(DioException error) {
  switch (error.type) {
    case DioException.connectionError:
      return "Connection Error";
    case DioException.connectionTimeout:
      return "Connection Timeout";
    case DioException.badResponse:
      return "Server Error";
    case DioException.receiveTimeout:
      return "Receiver Timeout";
    default:
      return "Something went wrong";
  }
}
