import '../../../domain/entity/user_in.dart';
import 'auth_repository_provider.dart';
import 'package:riverpod/riverpod.dart';

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  final loginCallback = ref.watch(authRepositoryProvider).login;
  final registerCallback = ref.watch(authRepositoryProvider).register;
  return AuthNotifier(
      loginCallback: loginCallback, registerCallback: registerCallback);
});

typedef LoginCallback = Future<UserIn> Function(
    {required String email, required String password});

typedef RegisterCallback = Future<UserIn> Function(
    {required String email,
    required String password,
    required String name,
    required String lastName});

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
  AuthNotifier({required this.loginCallback, required this.registerCallback})
      : super(AuthState());
  LoginCallback loginCallback;
  RegisterCallback registerCallback;

  Future<void> login({required String email, required String password}) async {
    try {
      final UserIn user = await loginCallback(email: email, password: password);
      setUserState(user);
    } catch (err) {
      logout(msg: 'Error generico en provider');
    }
  }

  Future<void> register(
      {required String email,
      required String password,
      required String name,
      required String lastName}) async {
    try {
      final UserIn user = await registerCallback(
          name: name, lastName: lastName, email: email, password: password);
      setUserState(user);
    } catch (err) {
      logout(
          msg: 'No se pudo registrar el usuario, quizás ya tengas una cuenta');
    }
  }

  void logout({String msg = ''}) {
    state = AuthState(message: msg, userStatus: UserStatus.notAuthenticated);
  }

  void setUserState(UserIn userIn) {
    state = AuthState(user: userIn, userStatus: UserStatus.authenticated);
  }

  void updateResources(
      {int friends = 0,
      int pendingRequests = 0,
      int decks = 0,
      int sharedDecks = 0,
      int followedDecks = 0}) {
    state = AuthState(
        message: state.message,
        userStatus: state.userStatus,
        user: UserIn(
            token: state.user!.token,
            user: state.user!.user,
            friends: state.user!.friends + friends,
            pendingRequests: state.user!.pendingRequests + pendingRequests,
            decks: state.user!.decks + decks,
            sharedDecks: state.user!.sharedDecks + sharedDecks,
            followedDecks: state.user!.followedDecks + followedDecks));
  }
}
