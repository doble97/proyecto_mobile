import 'package:go_router/go_router.dart';
import 'package:prontoictus_flutter/presentation/screens/screens.dart';

final appRouter = GoRouter(initialLocation: '/', routes: [
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
]);
