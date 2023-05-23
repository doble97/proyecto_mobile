import 'package:prontoictus_flutter/infrastructure/datasources/friends/search_datasource_impl.dart';

import '../../../domain/entity/user.dart';

class FriendRepositoryImpl {
  final SearchDatasourceImpl _datasource = SearchDatasourceImpl();

  Future<User> searchFriend(String email) async {
    final user = await _datasource.searchFriend(email);
    return user;
  }
}
