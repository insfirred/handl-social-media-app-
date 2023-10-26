import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:social_media/scr/constants/colors.dart';

import '../../repositories/app_repository.dart';
import '../../routing/app_router.dart';

@RoutePage()
class SplashView extends ConsumerStatefulWidget {
  const SplashView({
    super.key,
  });

  @override
  ConsumerState<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends ConsumerState<SplashView> {
  @override
  Widget build(BuildContext context) {
    ref.listen(appRepositoryProvider, (previous, next) {
      // _navigateBasedOnAuthStatus(next.status);
    });

    return Scaffold(
      body: Center(
        child: Text(
          'H a n d l',
          style: GoogleFonts.dosis(
            color: primaryColor,
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
      ),
    );
  }

  _navigateBasedOnAuthStatus(AppStatus authStatus) async {
    final router = context.router;
    if (authStatus == AppStatus.unauthenticated) {
      router.replace(const AuthRoute());
      debugPrint('NAVIGATION: Splash replaced with Auth Page');
    } else if (authStatus == AppStatus.authenticatedWithNoUserData) {
      router.replace(const CreateUsernameRoute());
      debugPrint('NAVIGATION: Splash replaced with CreateMail Page');
    } else if (authStatus == AppStatus.authenticatedWithUserData) {
      router.replace(const HomeRoute());
      debugPrint('NAVIGATION: Splash replaced with Main Page');
    }
  }
}
