import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:social_media/scr/repositories/app_repository.dart';

@RoutePage()
class ProfileView extends ConsumerWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userData = ref.watch(
      appRepositoryProvider.select((_) => _.userData),
    );
    return SafeArea(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              userData!.username,
              style: GoogleFonts.dosis(
                fontSize: 18,
                color: const Color.fromARGB(255, 0, 0, 0),
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              userData.email,
              style: GoogleFonts.dosis(
                fontSize: 18,
                color: const Color.fromARGB(255, 0, 0, 0),
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () =>
                  ref.read(appRepositoryProvider.notifier).logout(),
              child: Text(
                'Logout',
                style: GoogleFonts.dosis(
                  fontSize: 18,
                  color: const Color(0xFFFFDFDF),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
