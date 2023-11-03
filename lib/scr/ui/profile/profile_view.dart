import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:social_media/scr/repositories/app_repository.dart';
import 'package:social_media/scr/ui/profile/profile_view_model.dart';

import 'widgets/error_builder.dart';
import 'widgets/loading_builder.dart';

@RoutePage()
class ProfileView extends ConsumerWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userData = ref.watch(
      appRepositoryProvider.select((_) => _.userData),
    );
    bool imageExists = userData?.imageUrl != null;

    return SafeArea(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 100,
              height: 100,
              child: GestureDetector(
                onTap: () {
                  ref
                      .read(profileViewModelProvider.notifier)
                      .pickImageAndUpload();
                },
                child: imageExists
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: Image.network(
                          userData?.imageUrl ?? "",
                          fit: BoxFit.cover,
                          loadingBuilder: (context, child, loadingProgress) =>
                              loadingBuilder(context, child, loadingProgress),
                          errorBuilder: (context, error, stackTrace) => Center(
                            child: errorBuilder(),
                          ),
                        ),
                      )
                    : const CircleAvatar(
                        child: FaIcon(
                          FontAwesomeIcons.user,
                          size: 35,
                        ),
                      ),
              ),
            ),
            const SizedBox(height: 15),
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
