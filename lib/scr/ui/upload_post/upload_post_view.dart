import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'screens/upload_image.dart';
import 'screens/upload_tweet.dart';
import 'upload_post_view_model.dart';

@RoutePage()
class UploadPostView extends ConsumerStatefulWidget {
  const UploadPostView({
    super.key,
    required this.activeScreen,
  });

  final UploadPostScreen activeScreen;

  @override
  ConsumerState<UploadPostView> createState() => _UploadPostViewState();
}

class _UploadPostViewState extends ConsumerState<UploadPostView> {
  @override
  void initState() {
    Future.delayed(
      Duration.zero,
      () => ref
          .read(uploadPostViewModelProvider.notifier)
          .setUploadPostScreen(widget.activeScreen),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final activeScreen = ref.watch(
      uploadPostViewModelProvider.select((_) => _.screen),
    );

    return activeScreen == UploadPostScreen.tweet
        ? const UploadTweet()
        : const UploadImage();
  }
}
