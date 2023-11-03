import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import 'package:social_media/scr/ui/home/home_view_model.dart';

import '../../../constants/colors.dart';
import '../../../models/post.dart';
import '../../common_components/error_builder.dart';
import '../../common_components/loading_builder.dart';

class TweetCard extends ConsumerWidget {
  const TweetCard({
    super.key,
    required this.tweet,
    required this.selfLiked,
  });

  final Post tweet;
  final bool selfLiked;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
          color: secondaryColor,
          boxShadow: const [
            BoxShadow(
              blurRadius: 5,
              spreadRadius: 3,
              color: Color.fromARGB(50, 0, 0, 0),
              offset: Offset(2, 2),
            )
          ],
          borderRadius: BorderRadius.circular(15)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              tweet.createdByPic != null
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: SizedBox(
                        width: 28,
                        height: 28,
                        child: Image.network(
                          tweet.createdByPic ?? "",
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
              Text(
                tweet.createdByName,
                style: GoogleFonts.dosis(
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                ),
              ),
              const Spacer(),
              Text(
                // "${DateFormat.jm().format(tweet.createdAt)}  ${DateFormat('d MMMM yy').format(tweet.createdAt)}",
                DateFormat('d MMMM yy').format(tweet.createdAt),
                style: GoogleFonts.dosis(
                  color: Colors.grey[700],
                  fontSize: 15,
                ),
              ),
            ],
          ),
          Text(
            tweet.text,
            style: GoogleFonts.dosis(
              fontWeight: FontWeight.w600,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      ref
                          .read(homeViewModelProvider.notifier)
                          .setLikedPostId(tweet.id);
                      ref.read(homeViewModelProvider.notifier).likeBtnTapped();
                    },
                    child: selfLiked
                        ? const FaIcon(
                            FontAwesomeIcons.solidHeart,
                          )
                        : const FaIcon(
                            FontAwesomeIcons.heart,
                          ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    tweet.likes.toString(),
                    style: GoogleFonts.dosis(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              FaIcon(
                tweet.isBookmarked
                    ? FontAwesomeIcons.solidBookmark
                    : FontAwesomeIcons.bookmark,
              ),
            ],
          )
        ],
      ),
    );
  }
}
