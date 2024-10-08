import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:social_media/scr/models/chat_data.dart';
import 'package:social_media/scr/models/user_data.dart';
import 'package:social_media/scr/repositories/app_repository.dart';
import 'package:social_media/scr/ui/chats/chats_view_model.dart';
import 'package:intl/intl.dart';

import '../../routing/app_router.dart';
import '../../utils/bottom_sheet_utils.dart';
import '../common_components/error_builder.dart';
import '../common_components/loading_builder.dart';

@RoutePage()
class ChatsView extends ConsumerWidget {
  const ChatsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userDataList = ref.watch(
      chatsViewModelProvider.select((_) => _.userDataList),
    );
    final recentChats = ref.watch(
      chatsViewModelProvider.select((_) => _.recentChats),
    );
    final status = ref.watch(
      chatsViewModelProvider.select((_) => _.status),
    );
    return status == ChatsViewStatus.loading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : Scaffold(
            body: SafeArea(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 30,
                ),
                itemCount: recentChats.length,
                itemBuilder: (context, index) => RecentChatCard(
                  chatData: recentChats[index],
                ),
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () => showHandlBottomSheet(
                context: context,
                builder: (context) =>
                    NewChatBottomSheet(userDataList: userDataList),
              ),
              child: const Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
          );
  }
}

class NoRecentChatsWidget extends StatelessWidget {
  const NoRecentChatsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('No Recent Chatties'),
        ],
      ),
    );
  }
}

class NewChatBottomSheet extends ConsumerWidget {
  const NewChatBottomSheet({
    super.key,
    required this.userDataList,
  });

  final List<UserData> userDataList;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final status = ref.watch(
      chatsViewModelProvider.select((_) => _.status),
    );
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Whom you wanna chat today?',
            style: GoogleFonts.dosis(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 30),
          status == ChatsViewStatus.loading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: userDataList
                      .map((userData) => UserChatCard(userData: userData))
                      .toList(),
                ),
        ],
      ),
    );
  }
}

class UserChatCard extends ConsumerWidget {
  const UserChatCard({
    super.key,
    required this.userData,
  });

  final UserData userData;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        context.popRoute();
        ref
            .read(chatsViewModelProvider.notifier)
            .setChatUserForSingleChatViewModel(userData);
        context.router.push(SingleChatRoute(chatUser: userData));
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.only(bottom: 15),
        width: double.infinity,
        decoration: BoxDecoration(
          color: const Color(0xFFFFDFDF),
          boxShadow: const [
            BoxShadow(
              blurRadius: 10,
              spreadRadius: 2,
              color: Color.fromARGB(25, 0, 0, 0),
              offset: Offset(2, 2),
            ),
          ],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            userData.imageUrl != null
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: SizedBox(
                      width: 28,
                      height: 28,
                      child: Image.network(
                        userData.imageUrl ?? "",
                        fit: BoxFit.cover,
                        loadingBuilder: (context, child, loadingProgress) =>
                            loadingBuilder(context, child, loadingProgress),
                        errorBuilder: (context, error, stackTrace) => Center(
                          child: errorBuilder(),
                        ),
                      ),
                    ),
                  )
                : Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: const FaIcon(
                      FontAwesomeIcons.user,
                      size: 15,
                    ),
                  ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  userData.username,
                  style: GoogleFonts.dosis(fontWeight: FontWeight.bold),
                ),
                Text(
                  userData.email,
                  style: GoogleFonts.dosis(color: Colors.grey[700]),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class RecentChatCard extends ConsumerStatefulWidget {
  const RecentChatCard({
    super.key,
    required this.chatData,
  });

  final ChatData chatData;

  @override
  ConsumerState<RecentChatCard> createState() => _RecentChatCardState();
}

class _RecentChatCardState extends ConsumerState<RecentChatCard> {
  String? imageUrl;

  @override
  void initState() {
    super.initState();
    () async {
      final selfUid = ref.read(appRepositoryProvider).userData!.id;
      String chatUserUid = widget.chatData.lastMessage.from;
      if (chatUserUid == selfUid) {
        chatUserUid = widget.chatData.lastMessage.to;
      }
      imageUrl = await ref
          .read(appRepositoryProvider.notifier)
          .fetchImageUrlFromUid(chatUserUid);
      setState(() {});
    }();
  }

  @override
  Widget build(BuildContext context) {
    ChatData chatData = widget.chatData;
    final selfName = ref.read(appRepositoryProvider).userData!.username;
    String chatUserName = chatData.user1;

    if (chatUserName == selfName) {
      chatUserName = chatData.user2;
    }

    final selfUid = ref.read(appRepositoryProvider).userData!.id;
    String chatUserUid = chatData.lastMessage.from;

    if (chatUserUid == selfUid) {
      chatUserUid = chatData.lastMessage.to;
    }

    final userDataList = ref.watch(
      chatsViewModelProvider.select((_) => _.userDataList),
    );

    final chatUserData = userDataList
        .where((userData) => userData.id == chatUserUid)
        .toList()
        .first;
    return GestureDetector(
      onTap: () {
        ref
            .read(chatsViewModelProvider.notifier)
            .setChatUserForSingleChatViewModel(chatUserData);
        context.router.push(SingleChatRoute(chatUser: chatUserData));
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.only(bottom: 15),
        width: double.infinity,
        decoration: BoxDecoration(
          color: const Color(0xFFFFDFDF),
          boxShadow: const [
            BoxShadow(
              blurRadius: 2,
              spreadRadius: 2,
              color: Color.fromARGB(25, 0, 0, 0),
              offset: Offset(2, 2),
            ),
          ],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            imageUrl != null
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: SizedBox(
                      width: 35,
                      height: 35,
                      child: Image.network(
                        imageUrl ?? "",
                        fit: BoxFit.cover,
                        loadingBuilder: (context, child, loadingProgress) =>
                            loadingBuilder(context, child, loadingProgress),
                        errorBuilder: (context, error, stackTrace) => Center(
                          child: errorBuilder(),
                        ),
                      ),
                    ),
                  )
                : const CircleAvatar(
                    child: FaIcon(
                      FontAwesomeIcons.user,
                      size: 20,
                    ),
                  ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  chatUserName,
                  style: GoogleFonts.dosis(fontWeight: FontWeight.bold),
                ),
                Text(
                  widget.chatData.lastMessage.messageText,
                  style: GoogleFonts.dosis(color: Colors.grey[700]),
                ),
              ],
            ),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  DateFormat.jm().format(widget.chatData.lastMessage.createdAt),
                  style: GoogleFonts.dosis(color: Colors.grey[700]),
                ),
                Text(
                  DateFormat('MMMM d y')
                      .format(widget.chatData.lastMessage.createdAt),
                  style: GoogleFonts.dosis(color: Colors.grey[700]),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
