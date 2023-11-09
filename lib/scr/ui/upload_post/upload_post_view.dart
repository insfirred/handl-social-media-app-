import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/snackbar_utils.dart';
import '../common_components/text_field.dart';
import 'upload_post_view_model.dart';

class UploadTweet extends ConsumerStatefulWidget {
  const UploadTweet({super.key});

  @override
  ConsumerState<UploadTweet> createState() => _UploadTweetState();
}

class _UploadTweetState extends ConsumerState<UploadTweet> {
  late TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController();
    _controller.addListener(
      () {
        ref
            .read(uploadPostViewModelProvider.notifier)
            .setTweetText(_controller.text);
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(
      uploadPostViewModelProvider,
      (prev, next) {
        if (prev?.status == UploadPostViewStatus.error) {
          showErrorMessage(
            context,
            next.errorMessage ?? "Something went Wrong!",
          );
        }
      },
    );

    final status = ref.watch(
      uploadPostViewModelProvider.select((_) => _.status),
    );

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 25,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'What\'s in your mind?',
                style: GoogleFonts.dosis(
                  fontSize: 23,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 20),
              TextFieldHandl(
                leftPadding: 0,
                rightPadding: 0,
                controller: _controller,
                hint: 'Say Anything!',
              ),
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.center,
                child: ElevatedButton(
                  onPressed: () async {
                    if (await ref
                        .read(uploadPostViewModelProvider.notifier)
                        .uploadTweet()) {
                      context.router.pop();
                    }
                  },
                  child: status == UploadPostViewStatus.loading
                      ? const CircularProgressIndicator(color: Colors.white)
                      : Text(
                          'Post',
                          style: GoogleFonts.dosis(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

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

class UploadImage extends StatelessWidget {
  const UploadImage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: Text('Upload Image'),
        ),
      ),
    );
  }
}
