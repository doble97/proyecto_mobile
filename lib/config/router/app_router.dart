import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:prontoictus_flutter/config/router/app_router_notifier.dart';
import 'package:prontoictus_flutter/presentation/screens/screens.dart';

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
          path: '/reset-password',
          name: ResetPasswordScreen.name,
          builder: (context, state) => const ResetPasswordScreen(),
        ),
        GoRoute(
          path: '/dashboard',
          name: DashboardScreen.name,
          builder: (context, state) => const DashboardScreen(),
        ),
      ],
      redirect: (context, state) {
        print('---GO ROUTER---');
        final isGoingTo = state.subloc;
        final authenticated = goRouterNotifier.isAuthenticated;
        print('${isGoingTo}  ${authenticated}');
        if (!authenticated) {
          if (isGoingTo == '/' || isGoingTo == '/reset-password') return null;
          return '/';
        }
        if (authenticated) {
          if (isGoingTo == '/' || isGoingTo == '/reset-password') {
            return '/dashboard';
          }
          return null;
        }
        return null;
      });
});
