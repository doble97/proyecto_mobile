import 'package:prontoictus_flutter/domain/entity/user.dart';
import 'package:prontoictus_flutter/domain/entity/user_in.dart';

abstract class AuthDataSource {
  Future<UserIn> login(String email, String password);
  Future<UserIn> register(
      String email, String password, String name, String lastName);
}
