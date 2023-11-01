import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../../constants/colors.dart';
import '../../../models/tweet.dart';

class TweetCard extends StatelessWidget {
  const TweetCard({
    super.key,
    required this.tweet,
  });

  final Tweet tweet;

  @override
  Widget build(BuildContext context) {
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                tweet.createdByName,
                style: GoogleFonts.dosis(
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                ),
              ),
              Text(
                "${DateFormat.jm().format(tweet.createdAt)}  ${DateFormat('d MMMM yy').format(tweet.createdAt)}",
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
                  FaIcon(
                    tweet.selfLiked
                        ? FontAwesomeIcons.solidHeart
                        : FontAwesomeIcons.heart,
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
