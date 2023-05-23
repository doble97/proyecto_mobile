import 'dart:convert';
import 'package:prontoictus_flutter/domain/entity/user_in.dart';
import 'package:prontoictus_flutter/infrastructure/mappers/user_mapper.dart';
import 'package:prontoictus_flutter/infrastructure/models/auth_response.dart';

import '../../domain/datasources/auth_datasource.dart';
import '../client/client_dio.dart';

class AuthDatasourceImpl extends AuthDataSource {
  // final dio = Dio(BaseOptions(
  //     baseUrl: baseUrl, headers: {'Content-Type': 'Application/json'}));
  final dio = ClientDio().dioInstance;
  @override
  Future<UserIn> login(String email, String password) async {
    try {
      final response = await dio.post('/login',
          data: jsonEncode({'email': email, 'password': password}));
      return _jsonToUser(response.data);
    } catch (err) {
      throw Exception('Error controlado en el futuro');
    }
  }

  @override
  Future<UserIn> register(
      String email, String password, String name, String lastName) async {
    try {
      final response = await dio.post('/register',
          data: jsonEncode({
            'name': name,
            "last_name": lastName,
            "email": email,
            "password": password,
            "password_confirmation": password
          }));
      return _jsonToUser(response.data);
    } catch (err) {
      print(err);
      throw Exception("Error al crear usuario");
    }
  }

  UserIn _jsonToUser(Map<String, dynamic> json) {
    final response = AuthResponse.fromJson(json);
    final UserIn user = UserMapper.userModelToEntity(response.data);
    final dioSetToken = ClientDio();
    dioSetToken.setToken(user.token);
    return user;
  }
}
