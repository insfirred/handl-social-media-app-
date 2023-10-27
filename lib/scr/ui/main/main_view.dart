import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../repositories/app_repository.dart';
import '../../routing/app_router.dart';
import '../common_components/bottom_bar_handl.dart';

@RoutePage()
class MainView extends ConsumerStatefulWidget {
  const MainView({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _MainViewState();
}

class _MainViewState extends ConsumerState<MainView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // listen to authRepository
    // navigate to auth page if status is unauthenticated
    ref.listen(appRepositoryProvider, (previous, next) {
      if (next.status == AppStatus.unauthenticated) {
        context.replaceRoute(const AuthRoute());
      }
    });

    return AutoTabsScaffold(
      routes: const [
        HomeRoute(),
        ChatsRoute(),
        ProfileRoute(),
      ],
      bottomNavigationBuilder: (context, tabsRouter) => BottomBarHandl(
        key: ValueKey(tabsRouter.activeIndex),
      ),
    );
  }
}
