import 'package:prontoictus_flutter/domain/entity/user.dart';

class UserIn {
  final String token;
  final User user;
  final int friends;
  final int pendingRequests;
  final int decks;
  final int sharedDecks;
  final int followedDecks;
  UserIn({
    required this.token,
    required this.user,
    required this.friends,
    required this.pendingRequests,
    required this.decks,
    required this.sharedDecks,
    required this.followedDecks,
  });
}
