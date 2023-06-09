import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prontoictus_flutter/domain/entity/deck.dart';
import 'package:prontoictus_flutter/infrastructure/datasources/crud_datasource_impl.dart';
import 'package:prontoictus_flutter/infrastructure/repositories/crud_repository_impl.dart';
import 'package:prontoictus_flutter/presentation/providers/auth/auth_provider.dart';

class DeckState {
  final Deck deck;

  DeckState({String name = "", int language = 0})
      : deck = Deck(name: name, language: language);
}

final deckStateProvider = StateProvider<DeckState>((ref) {
  return DeckState();
});
final deckRepositoryProvider = FutureProvider.autoDispose<Deck>((ref) async {
  final repository = CrudRepositoryImpl(DeckCrudDatasourceImpl());

  try {
    final deckResource = ref.watch(deckStateProvider);
    print('Datos ${deckResource.deck.name}');
    final deck = await repository.create(
        userId: ref.read(authProvider).user!.user.id,
        resource: deckResource.deck);
    print('exito en el deck');
    deckResource.deck;
    ref.read(authProvider.notifier).updateResources(decks: 1);
    return deck;
  } catch (err) {
    print('Error en el deck $err');
    throw Exception('Error al crear baraja');
  }
});
