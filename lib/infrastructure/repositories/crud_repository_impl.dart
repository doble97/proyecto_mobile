import 'package:prontoictus_flutter/domain/datasources/crud_datasource.dart';
import 'package:prontoictus_flutter/domain/repositories/crud_repository.dart';

import '../../domain/entity/deck.dart';

class CrudRepositoryImpl implements CrudRepository<Deck> {
  final CrudDatasource _datasource;

  CrudRepositoryImpl(this._datasource);
  @override
  Future<Deck> create({required int userId, required Deck resource}) async {
    final deck = await _datasource.create(userId: userId, resource: resource);
    return deck;
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
