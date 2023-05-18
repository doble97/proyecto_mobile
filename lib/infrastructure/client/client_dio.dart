import 'package:dio/dio.dart';

import '../../config/constants.dart';

class ClientDio {
  static ClientDio? _instance;
  Dio? _dio;

  ClientDio._internal({String? token}) {
    _dio = Dio(
      BaseOptions(baseUrl: baseUrl, headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      }),
    );
  }

  factory ClientDio({String? token}) {
    if (_instance == null) {
      _instance = ClientDio._internal(token: token);
    }
    return _instance!;
  }
  setToken(String token) {
    _dio?.options.headers['Authorization'] = "Bearer $token";
  }

  Dio get dioInstance => _dio!;
}
