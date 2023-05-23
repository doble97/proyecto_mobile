import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prontoictus_flutter/infrastructure/repositories/decks/deck_repository.dart';
import 'package:prontoictus_flutter/presentation/providers/auth/auth_provider.dart';

import '../../../domain/entity/deck.dart';

final deckAllProvider = FutureProvider.autoDispose<List<Deck>>((ref) async {
  final userId = ref.read(authProvider).user!.user.id;
  final _repository = DeckRepository();
  final decks = await _repository.getAllDecks(userId);
  return decks;
});
