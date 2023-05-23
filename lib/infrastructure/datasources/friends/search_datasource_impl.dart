import 'dart:convert';

import 'package:prontoictus_flutter/domain/entity/user.dart';
import 'package:prontoictus_flutter/infrastructure/client/client_dio.dart';

class SearchDatasourceImpl {
  final _client = ClientDio().dioInstance;

  Future<User> searchFriend(String email) async {
    try {
      final response =
          await _client.post('/friend', data: jsonEncode({'email': email}));
      return _jsonToEntity(response.data);
    } catch (err) {
      print('Data source $err');
      throw Exception('Error al buscar usuario');
    }
  }

  User _jsonToEntity(Map<String, dynamic> json) {
    final User user = User(
        email: json['data']['email'],
        name: json['data']['name'],
        lastName: json['data']['last_name'],
        id: json['data']['id']);
    return user;
  }
}
