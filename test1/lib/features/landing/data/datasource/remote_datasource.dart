import 'dart:developer';

import 'package:dio/dio.dart';

class RemoteDatasource {
  final Dio dio;

  RemoteDatasource(this.dio);

  Future<String> getToken() async {
    try {
      final response = await dio.post(
        '/auth/login',
        data: {"username": "mor_2314", "password": "83r5^_"},
      );
      return response.data['token'];
    } catch (e) {
      log("api error: $e");
      return '';
    }
  }
}
