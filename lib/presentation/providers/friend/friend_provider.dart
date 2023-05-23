import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prontoictus_flutter/infrastructure/repositories/friend/friend_repository_impl.dart';

import '../../../domain/entity/user.dart';

class FriendState {
  final String email;
  final String msg;
  User? user;
  FriendState({this.user, this.email = "", this.msg = ""});
}

final friendState =
    StateProvider.autoDispose<FriendState>((ref) => FriendState());
final friendRepositoryProvider = FutureProvider.autoDispose<User>((ref) async {
  final repository = FriendRepositoryImpl();
  try {
    final email = ref.read(friendState);
    final resource = await repository.searchFriend(email.email);
    ref.read(friendState.notifier).state =
        FriendState(email: email.email, user: resource);
    return resource;
  } catch (err) {
    throw Exception('Error al buscar amigo');
  }
});
