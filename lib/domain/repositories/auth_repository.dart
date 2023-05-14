import '../entity/user_in.dart';

abstract class AuthRepository {
  Future<UserIn> login({required String email, required String password});
  Future<UserIn> register(
      String email, String password, String name, String lastName);
}
