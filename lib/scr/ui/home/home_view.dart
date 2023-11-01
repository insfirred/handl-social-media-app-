import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:social_media/scr/models/tweet.dart';
import 'package:social_media/scr/routing/app_router.dart';

import 'widgets/tweet_card.dart';

@RoutePage()
class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    List<Tweet> tweetsList = [
      Tweet(
        text: "First Tweet",
        createdAt: DateTime.now(),
        createdById: "ebcbvabkuvbkrevbaekav",
        createdByName: "Kalash",
        likes: 9,
        selfLiked: true,
        isBookmarked: false,
      ),
      Tweet(
        text: "Asla hum bhi rakhte hai pehalwaan, jab marji phet liye",
        createdAt: DateTime.now(),
        createdById: "ebcbvabkuvbkrevbaekav",
        createdByName: "Apple",
        likes: 7,
        selfLiked: true,
        isBookmarked: true,
      ),
      Tweet(
        text: "Bhupendra Jogi",
        createdAt: DateTime.now(),
        createdById: "ebcbvabkuvbkrevbaekav",
        createdByName: "Kalash",
        likes: 2,
        selfLiked: false,
        isBookmarked: false,
      ),
    ];
    return Scaffold(
      body: SafeArea(
        child: ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
          itemCount: tweetsList.length,
          itemBuilder: (context, index) => TweetCard(tweet: tweetsList[index]),
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
