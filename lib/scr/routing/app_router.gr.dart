// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    AuthRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AuthView(),
      );
    },
    ChatsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ChatsView(),
      );
    },
    CreateUsernameRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CreateUsernameView(),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomeView(),
      );
    },
    MainRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MainView(),
      );
    },
    ProfileRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ProfileView(),
      );
    },
    SingleChatRoute.name: (routeData) {
      final args = routeData.argsAs<SingleChatRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: SingleChatView(
          key: args.key,
          chatUser: args.chatUser,
        ),
      );
    },
    SplashRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SplashView(),
      );
    },
    UploadPostRoute.name: (routeData) {
      final args = routeData.argsAs<UploadPostRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: UploadPostView(
          key: args.key,
          activeScreen: args.activeScreen,
        ),
      );
    },
  };
}

/// generated route for
/// [AuthView]
class AuthRoute extends PageRouteInfo<void> {
  const AuthRoute({List<PageRouteInfo>? children})
      : super(
          AuthRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ChatsView]
class ChatsRoute extends PageRouteInfo<void> {
  const ChatsRoute({List<PageRouteInfo>? children})
      : super(
          ChatsRoute.name,
          initialChildren: children,
        );

  static const String name = 'ChatsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CreateUsernameView]
class CreateUsernameRoute extends PageRouteInfo<void> {
  const CreateUsernameRoute({List<PageRouteInfo>? children})
      : super(
          CreateUsernameRoute.name,
          initialChildren: children,
        );

  static const String name = 'CreateUsernameRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HomeView]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MainView]
class MainRoute extends PageRouteInfo<void> {
  const MainRoute({List<PageRouteInfo>? children})
      : super(
          MainRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ProfileView]
class ProfileRoute extends PageRouteInfo<void> {
  const ProfileRoute({List<PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SingleChatView]
class SingleChatRoute extends PageRouteInfo<SingleChatRouteArgs> {
  SingleChatRoute({
    Key? key,
    required UserData chatUser,
    List<PageRouteInfo>? children,
  }) : super(
          SingleChatRoute.name,
          args: SingleChatRouteArgs(
            key: key,
            chatUser: chatUser,
          ),
          initialChildren: children,
        );

  static const String name = 'SingleChatRoute';

  static const PageInfo<SingleChatRouteArgs> page =
      PageInfo<SingleChatRouteArgs>(name);
}

class SingleChatRouteArgs {
  const SingleChatRouteArgs({
    this.key,
    required this.chatUser,
  });

  final Key? key;

  final UserData chatUser;

  @override
  String toString() {
    return 'SingleChatRouteArgs{key: $key, chatUser: $chatUser}';
  }
}

/// generated route for
/// [SplashView]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [UploadPostView]
class UploadPostRoute extends PageRouteInfo<UploadPostRouteArgs> {
  UploadPostRoute({
    Key? key,
    required UploadPostScreen activeScreen,
    List<PageRouteInfo>? children,
  }) : super(
          UploadPostRoute.name,
          args: UploadPostRouteArgs(
            key: key,
            activeScreen: activeScreen,
          ),
          initialChildren: children,
        );

  static const String name = 'UploadPostRoute';

  static const PageInfo<UploadPostRouteArgs> page =
      PageInfo<UploadPostRouteArgs>(name);
}

class UploadPostRouteArgs {
  const UploadPostRouteArgs({
    this.key,
    required this.activeScreen,
  });

  final Key? key;

  final UploadPostScreen activeScreen;

  @override
  String toString() {
    return 'UploadPostRouteArgs{key: $key, activeScreen: $activeScreen}';
  }
}
