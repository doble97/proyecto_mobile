import '../../../domain/entity/user_in.dart';
import 'auth_repository_provider.dart';
import 'package:riverpod/riverpod.dart';

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  final loginCallback = ref.watch(authRepositoryProvider).login;
  return AuthNotifier(loginCallback: loginCallback);
});

typedef LoginCallback = Future<UserIn> Function(
    {required String email, required String password});

enum UserStatus { authenticated, notAuthenticated }

class AuthState {
  final UserIn? user;
  final String message;
  final UserStatus userStatus;
  AuthState(
      {this.user,
      this.message = "",
      this.userStatus = UserStatus.notAuthenticated});
}

class AuthNotifier extends StateNotifier<AuthState> {
  AuthNotifier({required this.loginCallback}) : super(AuthState());
  LoginCallback loginCallback;

  Future<void> login({required String email, required String password}) async {
    try {
      final UserIn user = await loginCallback(email: email, password: password);
      setUserState(user);
    } catch (err) {
      logout(msg: 'Error generico en provider');
    }
  }

  void logout({String msg = ''}) {
    state = AuthState(message: msg, userStatus: UserStatus.notAuthenticated);
  }

  void setUserState(UserIn userIn) {
    state = AuthState(user: userIn, userStatus: UserStatus.authenticated);
  }
}