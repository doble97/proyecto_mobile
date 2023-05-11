import '../entity/user.dart';
import '../entity/user_in.dart';

abstract class AuthRepository {
  Future<UserIn> login(String email, String password);
  Future<UserIn> register(
      String email, String password, String name, String lastName);
}
