import 'package:prontoictus_flutter/infrastructure/client/client_dio.dart';

import '../../domain/datasources/crud_datasource.dart';
import '../../domain/entity/deck.dart';

class CrudDatasourceImpl implements CrudDatasource<Deck> {
  final _client = ClientDio().dioInstance;
  @override
  Future<Deck> create({required int userId, required Deck resource}) async {
    final response = await _client.post('/create-deck',
        data: {"name": resource.name, "fk_language": resource.language});
    print(response.data);
    return resource;
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
}
