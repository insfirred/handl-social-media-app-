import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:social_media/scr/repositories/app_repository.dart';
import 'package:social_media/scr/routing/app_router.dart';

@RoutePage()
class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(
      appRepositoryProvider,
      (prev, next) {
        if (next.status == AppStatus.unauthenticated) {
          context.router.replace(const AuthRoute());
        }
      },
    );

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Home View'),
              const SizedBox(height: 50),
              ElevatedButton(
                onPressed: () =>
                    ref.read(appRepositoryProvider.notifier).logout(),
                child: const Text("Log out"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
