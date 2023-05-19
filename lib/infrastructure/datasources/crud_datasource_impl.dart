import 'package:prontoictus_flutter/infrastructure/client/client_dio.dart';

import '../../domain/datasources/crud_datasource.dart';
import '../../domain/entity/deck.dart';

class DeckCrudDatasourceImpl implements CrudDatasource<Deck> {
  final _client = ClientDio().dioInstance;
  @override
  Future<Deck> create({required int userId, required Deck resource}) async {
    try {
      final response = await _client.post('/create-deck',
          data: {"name": resource.name, "fk_language": resource.language});
      return _jsonToDeck(response.data['data']);
    } catch (err) {
      print('baraja -> ${resource.name}');
      print('ERRROR--> $err');
      throw Exception('Error al crear la baraja');
    }
  }

  @override
  Future<bool> delete({required int userId, int? resourceId}) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<List<Deck>> readAll({required int userId, int? resourceId}) {
    // TODO: implement readAll
    throw UnimplementedError();
  }

  Deck _jsonToDeck(Map<String, dynamic> json) {
    print('DATOS _JSON $json');
    final deck =
        Deck(name: json["name"], id: json['id'], language: json['fk_language']);
    return deck;
  }
}
