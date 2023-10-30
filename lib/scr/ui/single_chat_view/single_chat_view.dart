import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:social_media/scr/constants/colors.dart';
import 'package:social_media/scr/models/message.dart';
import 'package:social_media/scr/repositories/app_repository.dart';
import 'package:social_media/scr/utils/snackbar_utils.dart';

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
  // final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(
      singleChatViewModelProvider,
      (prev, next) {
        if (next.status == SingleChatViewStatus.error) {
          showErrorMessage(
            context,
            next.errorMessage ?? 'Something went wrong!',
          );
        }
      },
    );
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
      body: Column(
        children: [
          ChatsListWidget(
              // scrollController: scrollController,
              ),
          InputSection(
            chatUser: chatUser,
            // scrollController: scrollController,
          ),
        ],
      ),
    );
  }
}

class InputSection extends ConsumerStatefulWidget {
  const InputSection({
    super.key,
    required this.chatUser,
    // required this.scrollController,
  });

  final UserData chatUser;
  // final ScrollController scrollController;

  @override
  ConsumerState<InputSection> createState() => _InputSectionState();
}

class _InputSectionState extends ConsumerState<InputSection> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _controller.addListener(
      () {
        ref
            .read(singleChatViewModelProvider.notifier)
            .setTextFieldValue(_controller.text);
      },
    );
  }

  void _scrollDown() {
    // widget.scrollController.animateTo(
    //   widget.scrollController.position.maxScrollExtent,
    //   duration: const Duration(milliseconds: 0),
    //   curve: Curves.linear,
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            margin: const EdgeInsets.symmetric(
              vertical: 5,
              horizontal: 5,
            ),
            padding: const EdgeInsets.symmetric(
              vertical: 0,
              horizontal: 15,
            ),
            decoration: BoxDecoration(
              color: const Color(0xFFFFDFDF),
              borderRadius: BorderRadius.circular(30),
              boxShadow: const [
                BoxShadow(
                  blurRadius: 8,
                  spreadRadius: 3,
                  offset: Offset(1, 1),
                  color: Color.fromARGB(40, 0, 0, 0),
                ),
              ],
            ),
            child: TextField(
              controller: _controller,
              maxLines: 6,
              minLines: 1,
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Say Hi to ${widget.chatUser.username}',
              ),
              style: GoogleFonts.dosis(
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            ref.read(singleChatViewModelProvider.notifier).sendMessage();
            _controller.text = '';
            _scrollDown();
          },
          behavior: HitTestBehavior.opaque,
          child: Container(
            width: 50,
            height: 50,
            decoration: const BoxDecoration(
              color: primaryColor,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.send_rounded,
              color: Colors.white,
              size: 20,
            ),
          ),
        ),
        const SizedBox(width: 5),
      ],
    );
  }
}

class ChatsListWidget extends ConsumerWidget {
  const ChatsListWidget({
    super.key,
    // required this.scrollController,
  });

  // final ScrollController scrollController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final messagesList = ref.watch(
      singleChatViewModelProvider.select((_) => _.messagesList),
    );

    final status = ref.watch(
      singleChatViewModelProvider.select((_) => _.status),
    );

    // ref.listen(singleChatViewModelProvider, (prev, next) {
    //   if (next.messagesList != prev?.messagesList) {
    //     print('new size is: ');
    //     print(messagesList.length);
    //   }
    // });

    return status == SingleChatViewStatus.loading
        ? const Expanded(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          )
        : messagesList.isEmpty
            ? Expanded(
                child: Center(
                  child: Text(
                    'No conversation yet ',
                    style: GoogleFonts.dosis(fontWeight: FontWeight.w600),
                  ),
                ),
              )
            : Expanded(
                child: SingleChildScrollView(
                  // controller: scrollController,
                  child: Column(
                    children: messagesList.map((message) {
                      final String uid =
                          ref.read(appRepositoryProvider).authUser!.uid;
                      return MessageCard(
                        message: message,
                        selfCreated: message.from == uid,
                      );
                    }).toList(),
                  ),
                ),
              );
  }
}

class NoMessageWidget extends StatelessWidget {
  const NoMessageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Text(
          'No Messages',
          style: GoogleFonts.dosis(),
        ),
      ),
    );
  }
}

class MessageCard extends StatelessWidget {
  const MessageCard({
    super.key,
    required this.message,
    required this.selfCreated,
  });

  final Message message;
  final bool selfCreated;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: selfCreated ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: selfCreated
              ? Colors.amber
              : const Color.fromARGB(255, 224, 238, 239),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          message.messageText,
          style: GoogleFonts.dosis(
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
