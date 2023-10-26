import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:social_media/scr/ui/auth/auth_view_model.dart';

import '../../../constants/colors.dart';
import '../../common_components/text_field.dart';

class RegisterView extends ConsumerWidget {
  const RegisterView({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 80),
          const TextFieldHandl(
            hint: 'Username',
          ),
          const SizedBox(height: 20),
          const TextFieldHandl(
            hint: 'Password',
          ),
          const SizedBox(height: 20),
          const TextFieldHandl(
            hint: 'Confirm password',
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {},
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                'Register',
                style: GoogleFonts.dosis(
                  fontSize: 18,
                  color: const Color(0xFFFFDFDF),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(height: 35),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Already have an account',
                  style: GoogleFonts.dosis(color: Colors.grey[600]),
                ),
                const SizedBox(width: 8),
                GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () => ref
                      .read(authViewModelProvider.notifier)
                      .setAuthPageScreen(AuthPageScreen.login),
                  child: Text(
                    'Login here',
                    style: GoogleFonts.dosis(
                      fontWeight: FontWeight.bold,
                      color: secondaryColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
