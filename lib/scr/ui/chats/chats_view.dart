import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:social_media/scr/models/user_data.dart';
import 'package:social_media/scr/routing/app_router.dart';
import 'package:social_media/scr/ui/chats/chats_view_model.dart';

import '../../utils/bottom_sheet_utils.dart';

@RoutePage()
class ChatsView extends ConsumerWidget {
  const ChatsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userDataList = ref.watch(
      chatsViewModelProvider.select((_) => _.userDataList),
    );
    return Scaffold(
      body: const SafeArea(
        child: Center(
          child: Column(
            children: [
              Text('data'),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showHandlBottomSheet(
          context: context,
          builder: (context) => NewChatBottomSheet(userDataList: userDataList),
        ),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
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

class UserChatCard extends StatelessWidget {
  const UserChatCard({
    super.key,
    required this.userData,
  });

  final UserData userData;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.popRoute();
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
        child: Column(
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
      ),
    );
  }
}
