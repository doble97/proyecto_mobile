import 'package:prontoictus_flutter/domain/entity/token.dart';
import 'package:prontoictus_flutter/domain/entity/user.dart';

class UserIn {
  final Token token;
  final User user;

  UserIn({required this.token, required this.user});
}
