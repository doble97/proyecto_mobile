import 'package:prontoictus_flutter/infrastructure/datasources/auth_datasource_imp.dart';
import 'package:prontoictus_flutter/infrastructure/repositories/auth_repository_imp.dart';
import 'package:riverpod/riverpod.dart';

final authRepositoryProvider =
    Provider((ref) => AuthRepositoryImp(AuthDatasourceImpl()));
