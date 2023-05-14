import 'package:prontoictus_flutter/domain/entity/user.dart';

class UserIn {
  final String token;
  final User user;

  UserIn({required this.token, required this.user});
}
