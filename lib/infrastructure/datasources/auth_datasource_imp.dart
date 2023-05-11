import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:prontoictus_flutter/config/constants.dart';
import 'package:prontoictus_flutter/domain/entity/user.dart';
import 'package:prontoictus_flutter/domain/entity/user_in.dart';
import 'package:prontoictus_flutter/infrastructure/mappers/user_mapper.dart';
import 'package:prontoictus_flutter/infrastructure/models/auth_response.dart';

import '../../domain/datasources/auth_datasource.dart';

class AuthDatasourceImpl extends AuthDataSource {
  final dio = Dio(BaseOptions(
      baseUrl: baseUrl, headers: {'Content-Type': 'Application/json'}));
  @override
  Future<UserIn> login(String email, String password) async {
    // TODO: implement login
    final response = await dio.post('/login',
        data: jsonEncode({'email': email, 'password': password}));
    return _jsonToUser(response.data);
  }

  @override
  Future<UserIn> register(
      String email, String password, String name, String lastName) {
    // TODO: implement register
    throw UnimplementedError();
  }

  UserIn _jsonToUser(Map<String, dynamic> json) {
    final response = AuthResponse.fromJson(json);
    final UserIn user = UserMapper.userModelToEntity(response.data);
    return user;
  }
}
