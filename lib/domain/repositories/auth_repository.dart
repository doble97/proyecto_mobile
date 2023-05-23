import '../entity/user_in.dart';

abstract class AuthRepository {
  Future<UserIn> login({required String email, required String password});
  Future<UserIn> register(
      {required String email,
      required String password,
      required String name,
      required String lastName});
}
