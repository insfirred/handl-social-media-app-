import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:social_media/scr/ui/upload_post/upload_post_view_model.dart';

import '../../../constants/colors.dart';
import '../../../routing/app_router.dart';

class UploadPostBottomSheet extends ConsumerWidget {
  const UploadPostBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: MediaQuery.of(context).size.height,
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 25,
      ),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                context.router.pop();
                context.router.push(
                  UploadPostRoute(activeScreen: UploadPostScreen.image),
                );
              },
              child: Container(
                height: (MediaQuery.of(context).size.width - 80) / 2,
                decoration: BoxDecoration(
                  color: secondaryColor,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Center(
                  child: Text(
                    'Post an image',
                    style: GoogleFonts.dosis(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 40),
          Expanded(
            child: GestureDetector(
              onTap: () {
                context.router.pop();
                context.router.push(
                  UploadPostRoute(activeScreen: UploadPostScreen.tweet),
                );
              },
              child: Container(
                height: (MediaQuery.of(context).size.width - 80) / 2,
                decoration: BoxDecoration(
                  color: secondaryColor,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Center(
                  child: Text(
                    'Post a Tweet',
                    style: GoogleFonts.dosis(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
