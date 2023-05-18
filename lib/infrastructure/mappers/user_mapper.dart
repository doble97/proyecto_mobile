import '../../domain/entity/user.dart';
import '../../domain/entity/user_in.dart';
import '../models/auth_response.dart';

class UserMapper {
  static UserIn userModelToEntity(Data data) {
    final UserIn user = UserIn(
        token: data.token,
        user: User(
            email: data.user.email,
            name: data.user.name,
            lastName: data.user.lastName,
            id: data.user.id),
        friends: data.friends,
        pendingRequests: data.pendingRequests,
        decks: data.decks,
        sharedDecks: data.sharedDecks,
        followedDecks: data.followedDecks);
    return user;
  }
}
