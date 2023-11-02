import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:social_media/scr/constants/enums_handl.dart';

part 'post.g.dart';

@JsonSerializable()
class Post {
  final String id;
  final PostType type;
  final String text;
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @JsonKey(name: 'created_by_id')
  final String createdById;
  @JsonKey(name: 'created_by_name')
  final String createdByName;
  final int likes;
  @JsonKey(name: 'liked_by')
  final List<String> likedBy;
  @JsonKey(name: 'is_boormarked')
  final bool isBookmarked;

  const Post({
    this.id = "",
    required this.type,
    required this.text,
    required this.createdAt,
    required this.createdById,
    required this.createdByName,
    required this.likes,
    required this.likedBy,
    required this.isBookmarked,
  });

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
  Map<String, dynamic> toJson() => _$PostToJson(this);
}
