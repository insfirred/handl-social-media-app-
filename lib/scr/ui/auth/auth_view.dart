import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:social_media/scr/ui/auth/auth_view_model.dart';

import '../../constants/colors.dart';
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
                        activeScreen == AuthPageScreen.login
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
                  child: activeScreen == AuthPageScreen.login
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
