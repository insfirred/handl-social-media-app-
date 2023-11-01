import 'package:freezed_annotation/freezed_annotation.dart';

part 'tweet.g.dart';

@JsonSerializable()
class Tweet {
  final String text;
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @JsonKey(name: 'created_by_id')
  final String createdById;
  @JsonKey(name: 'created_by_name')
  final String createdByName;
  final int likes;
  @JsonKey(name: 'self_liked')
  final bool selfLiked;
  @JsonKey(name: 'is_boormarked')
  final bool isBookmarked;

  const Tweet({
    required this.text,
    required this.createdAt,
    required this.createdById,
    required this.createdByName,
    required this.likes,
    required this.selfLiked,
    required this.isBookmarked,
  });

  factory Tweet.fromJson(Map<String, dynamic> json) => _$TweetFromJson(json);
  Map<String, dynamic> toJson() => _$TweetToJson(this);
}
