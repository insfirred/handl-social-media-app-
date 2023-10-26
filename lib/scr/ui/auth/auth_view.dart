import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/colors.dart';
import '../../repositories/app_repository.dart';
import '../../routing/app_router.dart';
import '../../utils/snackbar_utils.dart';
import 'auth_view_model.dart';
import 'views/login_view.dart';
import 'views/register_view.dart';

@RoutePage()
class AuthView extends ConsumerWidget {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeScreen = ref.watch(
      authViewModelProvider.select((_) => _.activeScreen),
    );

    ref.listen(
      appRepositoryProvider,
      (prev, next) {
        if (next.status == AppStatus.authenticatedWithUserData) {
          context.replaceRoute(const HomeRoute());
        } else if (next.status == AppStatus.authenticatedWithNoUserData) {
          context.replaceRoute(const CreateUsernameRoute());
        }
      },
    );

    ref.listen(authViewModelProvider, (previous, next) {
      if (next.status == AuthViewStatus.error) {
        showErrorMessage(
          context,
          next.errorMessage ?? 'Something went wrong!',
        );
      }
    });

    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Column(
              children: [
                SizedBox(
                  height: 200,
                  child: Center(
                    child: Hero(
                      tag: 'Handl',
                      child: Text(
                        activeScreen == AuthViewScreen.login
                            ? 'LOGIN'
                            : 'REGISTER',
                        style: GoogleFonts.dosis(
                          letterSpacing: 5,
                          color: primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 35,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: activeScreen == AuthViewScreen.login
                      ? const LoginView()
                      : const RegisterView(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
