import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:social_media/scr/repositories/app_repository.dart';

import '../../routing/app_router.dart';
import 'home_view_model.dart';
import 'widgets/tweet_card.dart';

@RoutePage()
class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final error = ref.watch(
          homeViewModelProvider.select((_) => _.errorMessage),
        ) ??
        "Something went wrong";
    final status = ref.watch(
      homeViewModelProvider.select((_) => _.status),
    );
    final posts = ref.watch(
      homeViewModelProvider.select((_) => _.posts),
    );

    return Scaffold(
      body: SafeArea(
        child: status == HomeViewStatus.loading
            ? const Center(child: CircularProgressIndicator())
            : status == HomeViewStatus.error
                ? Center(
                    child: Text(error),
                  )
                : posts.isEmpty
                    ? const Center(child: Text("No Posts"))
                    : ListView.builder(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 25),
                        itemCount: posts.length,
                        itemBuilder: (context, index) => TweetCard(
                          tweet: posts[index],
                          selfLiked: posts[index].likedBy.contains(
                                ref.read(appRepositoryProvider).authUser!.uid,
                              ),
                        ),
                      ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.router.push(const UploadPostRoute());
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
