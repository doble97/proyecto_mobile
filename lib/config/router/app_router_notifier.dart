import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prontoictus_flutter/presentation/providers/auth/auth_provider.dart';

final appRouterNotifierProvider = Provider((ref) {
  final authNotifier = ref.read(authProvider.notifier);
  return AppRouterNotifier(authNotifier);
});

class AppRouterNotifier extends ChangeNotifier {
  final AuthNotifier _authNotifier;
  bool isAuthenticated = false;
  AppRouterNotifier(this._authNotifier) {
    _authNotifier.addListener((state) {
      if (state.userStatus == UserStatus.authenticated) {
        makeAuthentication(true);
      } else {
        makeAuthentication(false);
      }
    });
  }
  void makeAuthentication(bool value) {
    isAuthenticated = value;
    notifyListeners();
  }
}
