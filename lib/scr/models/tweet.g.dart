// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tweet.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Tweet _$TweetFromJson(Map<String, dynamic> json) => Tweet(
      text: json['text'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      createdById: json['created_by_id'] as String,
      createdByName: json['created_by_name'] as String,
      likes: json['likes'] as int,
      selfLiked: json['self_liked'] as bool,
      isBookmarked: json['is_boormarked'] as bool,
    );

Map<String, dynamic> _$TweetToJson(Tweet instance) => <String, dynamic>{
      'text': instance.text,
      'created_at': instance.createdAt.toIso8601String(),
      'created_by_id': instance.createdById,
      'created_by_name': instance.createdByName,
      'likes': instance.likes,
      'self_liked': instance.selfLiked,
      'is_boormarked': instance.isBookmarked,
    };
