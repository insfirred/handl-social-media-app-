// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatData _$ChatDataFromJson(Map<String, dynamic> json) => ChatData(
      allMessagesList: (json['all_messages_list'] as List<dynamic>)
          .map((e) => Message.fromJson(e as Map<String, dynamic>))
          .toList(),
      lastMessage:
          Message.fromJson(json['last_message'] as Map<String, dynamic>),
      user1: json['user1'] as String,
      user2: json['user2'] as String,
    );

Map<String, dynamic> _$ChatDataToJson(ChatData instance) => <String, dynamic>{
      'all_messages_list': instance.allMessagesList,
      'last_message': instance.lastMessage,
      'user1': instance.user1,
      'user2': instance.user2,
    };
