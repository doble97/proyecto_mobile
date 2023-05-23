import 'package:prontoictus_flutter/infrastructure/datasources/crud_datasource_impl.dart';

import '../../../domain/entity/deck.dart';

class DeckRepository {
  final _datasource = DeckCrudDatasourceImpl();

  Future<List<Deck>> getAllDecks(int userId) async {
    final decks = await _datasource.readAll(userId: userId);
    return decks;
  }
}
