import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants/colors.dart';
import '../../common_components/text_field.dart';
import '../auth_view_model.dart';

class LoginView extends ConsumerStatefulWidget {
  const LoginView({
    super.key,
  });

  @override
  ConsumerState<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends ConsumerState<LoginView> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _emailController.addListener(
      () {
        ref
            .read(authViewModelProvider.notifier)
            .setEmail(_emailController.text);
      },
    );
    _passwordController.addListener(
      () {
        ref
            .read(authViewModelProvider.notifier)
            .setPassword(_passwordController.text);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final showPassword = ref.watch(
      authViewModelProvider.select((_) => _.showPassword),
    );
    final password = ref.watch(
      authViewModelProvider.select((_) => _.password),
    );
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 80),
          TextFieldHandl(
            controller: _emailController,
            hint: 'Email',
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
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () => ref.read(authViewModelProvider.notifier).login(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                'Login',
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
                  'Didn\'t have an account',
                  style: GoogleFonts.dosis(color: Colors.grey[600]),
                ),
                const SizedBox(width: 8),
                GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () => ref
                      .read(authViewModelProvider.notifier)
                      .setAuthPageScreen(AuthViewScreen.register),
                  child: Text(
                    'Register here',
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

class CurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = const Color(0xFFFFDFDF);
    paint.style = PaintingStyle.fill;

    var path = Path();

    path.moveTo(0, size.height * 0.15);
    path.quadraticBezierTo(
      size.width / 2,
      size.height / 4,
      size.width,
      size.height * 0.15,
    );
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
