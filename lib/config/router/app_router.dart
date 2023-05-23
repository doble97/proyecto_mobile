import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:prontoictus_flutter/config/router/app_router_notifier.dart';
import 'package:prontoictus_flutter/presentation/screens/add/add_word/add_word_screen.dart';
import 'package:prontoictus_flutter/presentation/screens/deck/deck_screen.dart';
import 'package:prontoictus_flutter/presentation/screens/register/register_screen.dart';
import 'package:prontoictus_flutter/presentation/screens/screens.dart';

import '../../presentation/screens/add/add_deck/add_deck_screen.dart';

// final appRouter = GoRouter(initialLocation: '/', routes: [
//   GoRoute(
//     path: '/',
//     name: LoginScreen.name,
//     builder: (context, state) => const LoginScreen(),
//   ),
//   GoRoute(
//     path: '/reset-password',
//     name: ResetPasswordScreen.name,
//     builder: (context, state) => const ResetPasswordScreen(),
//   ),
//   GoRoute(
//     path: '/dashboard',
//     name: DashboardScreen.name,
//     builder: (context, state) => const DashboardScreen(),
//   ),
// ]);
final goRouterProvier = Provider((ref) {
  final goRouterNotifier = ref.read(appRouterNotifierProvider);
  return GoRouter(
      initialLocation: '/',
      refreshListenable: goRouterNotifier,
      routes: [
        GoRoute(
          path: '/',
          name: LoginScreen.name,
          builder: (context, state) => const LoginScreen(),
        ),
        GoRoute(
          path: '/register',
          builder: (context, state) => RegisterScreen(),
        ),
        GoRoute(
          path: '/reset-password',
          name: ResetPasswordScreen.name,
          builder: (context, state) => const ResetPasswordScreen(),
        ),
        GoRoute(
          path: '/dashboard',
          name: DashboardScreen.name,
          builder: (context, state) => const DashboardScreen(),
        ),
        GoRoute(
          path: '/add-deck',
          name: AddDeckScreen.name,
          builder: (context, state) => const AddDeckScreen(),
        ),
        GoRoute(
          path: '/add-friend',
          name: AddFriendScreen.name,
          builder: (context, state) => const AddFriendScreen(),
        ),
        GoRoute(
          path: '/add-word',
          builder: (context, state) => const AddWordScreen(),
        ),
        GoRoute(
          path: '/decks',
          name: DeckScreen.name,
          builder: (context, state) => const DeckScreen(),
        ),
      ],
      redirect: (context, state) {
        print('---GO ROUTER---');
        final isGoingTo = state.subloc;
        final authenticated = goRouterNotifier.isAuthenticated;
        print('${isGoingTo}  ${authenticated}');
        if (!authenticated) {
          if (isGoingTo == '/' ||
              isGoingTo == '/reset-password' ||
              isGoingTo == '/register') return null;
          return '/';
        }
        if (authenticated) {
          if (isGoingTo == '/' ||
              isGoingTo == '/reset-password' ||
              isGoingTo == '/register') {
            return '/dashboard';
          }
          return null;
        }
        return null;
      });
});
