import 'package:prontoictus_flutter/domain/datasources/auth_datasource.dart';
import 'package:prontoictus_flutter/domain/entity/user_in.dart';

import '../../domain/repositories/auth_repository.dart';

class AuthRepositoryImp extends AuthRepository {
  final AuthDataSource _dataSource;

  AuthRepositoryImp(this._dataSource);
  @override
  Future<UserIn> login({required String email, required String password}) {
    return _dataSource.login(email, password);
  }

  @override
  Future<UserIn> register(
      {required String email,
      required String password,
      required String name,
      required String lastName}) async {
    return _dataSource.register(email, password, name, lastName);
  }
}
