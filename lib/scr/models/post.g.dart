// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Post _$PostFromJson(Map<String, dynamic> json) => Post(
      id: json['id'] as String? ?? "",
      type: $enumDecode(_$PostTypeEnumMap, json['type']),
      text: json['text'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      createdById: json['created_by_id'] as String,
      createdByName: json['created_by_name'] as String,
      createdByPic: json['created_by_pic'] as String?,
      likes: json['likes'] as int,
      likedBy:
          (json['liked_by'] as List<dynamic>).map((e) => e as String).toList(),
      isBookmarked: json['is_boormarked'] as bool,
    );

Map<String, dynamic> _$PostToJson(Post instance) => <String, dynamic>{
      'id': instance.id,
      'type': _$PostTypeEnumMap[instance.type]!,
      'text': instance.text,
      'created_at': instance.createdAt.toIso8601String(),
      'created_by_id': instance.createdById,
      'created_by_name': instance.createdByName,
      'created_by_pic': instance.createdByPic,
      'likes': instance.likes,
      'liked_by': instance.likedBy,
      'is_boormarked': instance.isBookmarked,
    };

const _$PostTypeEnumMap = {
  PostType.tweet: 'tweet',
  PostType.images: 'images',
};
