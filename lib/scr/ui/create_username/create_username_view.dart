import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:social_media/scr/utils/snackbar_utils.dart';

import '../../repositories/app_repository.dart';
import '../../routing/app_router.dart';
import '../common_components/text_field.dart';
import 'create_username_view_model.dart';

@RoutePage()
class CreateUsernameView extends ConsumerStatefulWidget {
  const CreateUsernameView({super.key});

  @override
  ConsumerState<CreateUsernameView> createState() => _CreateUsernameViewState();
}

class _CreateUsernameViewState extends ConsumerState<CreateUsernameView> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _controller.addListener(
      () {
        ref
            .read(createUsernameViewModelProvider.notifier)
            .setUsername(_controller.text.trim());
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(
      appRepositoryProvider,
      (prev, next) {
        if (next.status == AppStatus.authenticatedWithUserData) {
          context.replaceRoute(const HomeRoute());
        }
      },
    );

    ref.listen(
      createUsernameViewModelProvider,
      (prev, next) {
        if (next.status == CreateUsernameViewStatus.error) {
          showErrorMessage(
            context,
            next.errorMessage ?? 'Something went wrong!',
          );
        }
      },
    );

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFieldHandl(
                  controller: _controller,
                  hint: 'What should we call you?',
                ),
                const SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () => ref
                      .read(createUsernameViewModelProvider.notifier)
                      .createUserName(),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Text(
                      'Submit',
                      style: GoogleFonts.dosis(
                        fontSize: 18,
                        color: const Color(0xFFFFDFDF),
                        fontWeight: FontWeight.bold,
                      ),
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
