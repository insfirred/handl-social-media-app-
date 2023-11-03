import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../models/user_data.dart';
import '../ui/auth/auth_view.dart';
import '../ui/chats/chats_view.dart';
import '../ui/create_username/create_username_view.dart';
import '../ui/home/home_view.dart';
import '../ui/main/main_view.dart';
import '../ui/profile/profile_view.dart';
import '../ui/single_chat/single_chat_view.dart';
import '../ui/splash/splash_view.dart';
import '../ui/upload_post/upload_post_view.dart';

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
          path: '/main',
          page: MainRoute.page,
          children: [
            AutoRoute(
              path: 'home',
              page: HomeRoute.page,
            ),
            AutoRoute(
              path: 'profile',
              page: ChatsRoute.page,
            ),
            AutoRoute(
              path: 'chats',
              page: ProfileRoute.page,
            ),
          ],
        ),
        AutoRoute(
          path: '/auth',
          page: AuthRoute.page,
        ),
        AutoRoute(
          path: '/create-username',
          page: CreateUsernameRoute.page,
        ),
        AutoRoute(
          path: '/single-chat',
          page: SingleChatRoute.page,
        ),
        AutoRoute(
          path: '/upload-post',
          page: UploadPostRoute.page,
        ),
      ];
}
