import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'config/router/app_router.dart';
import 'config/theme/app_theme.dart';

void main() => runApp(const ProviderScope(child: MyApp()));

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appRouter = ref.watch(goRouterProvier);
    return MaterialApp.router(
      routerConfig: appRouter,
      theme: Apptheme().getTheme(),
      title: 'Kario',
      debugShowCheckedModeBanner: false,
    );
  }
}
