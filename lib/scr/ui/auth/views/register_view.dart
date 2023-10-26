import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:social_media/scr/ui/auth/auth_view_model.dart';

import '../../../constants/colors.dart';
import '../../common_components/text_field.dart';

class RegisterView extends ConsumerStatefulWidget {
  const RegisterView({
    super.key,
  });

  @override
  ConsumerState<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends ConsumerState<RegisterView> {
  late final TextEditingController _usernameController;
  late final TextEditingController _passwordController;
  late final TextEditingController _confirmPasswordController;

  @override
  void initState() {
    super.initState();
    _usernameController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
    _usernameController.addListener(
      () {
        ref
            .read(authViewModelProvider.notifier)
            .setUsername(_usernameController.text);
      },
    );
    _passwordController.addListener(
      () {
        ref
            .read(authViewModelProvider.notifier)
            .setPassword(_passwordController.text);
      },
    );
    _confirmPasswordController.addListener(
      () {
        ref
            .read(authViewModelProvider.notifier)
            .setConfirmPassword(_confirmPasswordController.text);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final showPassword = ref.watch(
      authViewModelProvider.select((_) => _.showPassword),
    );
    final showConfirmPassword = ref.watch(
      authViewModelProvider.select((_) => _.showConfirmPassword),
    );
    final password = ref.watch(
      authViewModelProvider.select((_) => _.password),
    );
    final confirmPassword = ref.watch(
      authViewModelProvider.select((_) => _.confirmPassword),
    );
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 80),
          TextFieldHandl(
            controller: _usernameController,
            hint: 'Username',
          ),
          const SizedBox(height: 20),
          TextFieldHandl(
            controller: _passwordController,
            hint: 'Password',
            isObscure: !showPassword,
            suffixIcon: password.isNotEmpty
                ? GestureDetector(
                    onTap: () => ref
                        .read(authViewModelProvider.notifier)
                        .setShowPassword(!showPassword),
                    behavior: HitTestBehavior.opaque,
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Image.asset(
                        !showPassword
                            ? 'assets/images/eye-slash.png'
                            : 'assets/images/eye.png',
                        width: 10,
                        color: Colors.grey[600],
                      ),
                    ),
                  )
                : null,
          ),
          const SizedBox(height: 20),
          TextFieldHandl(
            controller: _confirmPasswordController,
            hint: 'Confirm password',
            suffixIcon: confirmPassword.isNotEmpty
                ? GestureDetector(
                    onTap: () => ref
                        .read(authViewModelProvider.notifier)
                        .setShowConfirmPassword(!showConfirmPassword),
                    behavior: HitTestBehavior.opaque,
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Image.asset(
                        !showConfirmPassword
                            ? 'assets/images/eye-slash.png'
                            : 'assets/images/eye.png',
                        width: 10,
                        color: Colors.grey[600],
                      ),
                    ),
                  )
                : null,
            isObscure: !showConfirmPassword,
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
