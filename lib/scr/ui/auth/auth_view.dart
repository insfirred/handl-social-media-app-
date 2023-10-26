import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/colors.dart';
import '../common_components/text_field.dart';

@RoutePage()
class AuthView extends StatelessWidget {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {
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
                        'LOGIN',
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
                  child: SingleChildScrollView(
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
                        const SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () {},
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
                        const SizedBox(height: 50),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 50),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                'Didn\'t have an account',
                                style:
                                    GoogleFonts.dosis(color: Colors.grey[600]),
                              ),
                              const SizedBox(width: 8),
                              Text(
                                'Register here',
                                style: GoogleFonts.dosis(
                                  fontWeight: FontWeight.bold,
                                  color: secondaryColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
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
