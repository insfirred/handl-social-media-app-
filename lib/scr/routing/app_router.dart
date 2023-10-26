import 'package:auto_route/auto_route.dart';

import '../ui/auth/auth_view.dart';
import '../ui/create_username/create_username_view.dart';
import '../ui/home/home_view.dart';
import '../ui/splash/splash_view.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'View,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        /// routes go here
        AutoRoute(
          path: '/',
          page: SplashRoute.page,
        ),
        AutoRoute(
          path: '/home',
          page: HomeRoute.page,
        ),
        AutoRoute(
          path: '/auth',
          page: AuthRoute.page,
        ),
        AutoRoute(
          path: '/create-username',
          page: CreateUsernameRoute.page,
        ),
      ];
}
