import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:social_media/scr/constants/colors.dart';

import '../../models/user_data.dart';
import 'single_chat_view_model.dart';

@RoutePage()
class SingleChatView extends ConsumerStatefulWidget {
  const SingleChatView({
    super.key,
    required this.chatUser,
  });

  final UserData chatUser;

  @override
  ConsumerState<SingleChatView> createState() => _SingleChatViewState();
}

class _SingleChatViewState extends ConsumerState<SingleChatView> {
  @override
  void initState() {
    super.initState();
    () async {
      await Future.delayed(Duration.zero, () {
        ref
            .read(singleChatViewModelProvider.notifier)
            .setChatUserId(widget.chatUser);
      });
    }();
  }

  @override
  Widget build(BuildContext context) {
    UserData chatUser = widget.chatUser;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: secondaryColor,
        elevation: 1,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(chatUser.username),
            Text(
              chatUser.email,
              style: GoogleFonts.dosis(
                color: Colors.black,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
      body: Center(
        child: Text(
          'Say Hello to ${chatUser.username}',
          style: GoogleFonts.dosis(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
