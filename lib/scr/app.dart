import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:social_media/scr/constants/theme.dart';

import 'repositories/theme_repository.dart';
import 'routing/app_router.dart';

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  late final AppRouter _appRouter;

  @override
  void initState() {
    super.initState();
    _appRouter = AppRouter();
  }

  @override
  void dispose() {
    super.dispose();
    _appRouter.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currentThemeMode = ref.watch(
      themeRepositoryProvider.select(
        (appTheme) {
          switch (appTheme) {
            case AppTheme.light:
              return ThemeMode.light;
            case AppTheme.dark:
              return ThemeMode.dark;
            default:
              return ThemeMode.system;
          }
        },
      ),
    );

    return MaterialApp.router(
      title: 'Handl',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: currentThemeMode,
      debugShowCheckedModeBanner: false,
      routerConfig: _appRouter.config(),
    );
  }
}
