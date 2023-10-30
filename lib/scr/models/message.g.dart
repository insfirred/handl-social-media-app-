// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Message _$MessageFromJson(Map<String, dynamic> json) => Message(
      createdAt: DateTime.parse(json['created_at'] as String),
      from: json['from'] as String,
      to: json['to'] as String,
      messageText: json['message_text'] as String,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$MessageToJson(Message instance) => <String, dynamic>{
      'created_at': instance.createdAt.toIso8601String(),
      'from': instance.from,
      'to': instance.to,
      'message_text': instance.messageText,
      'id': instance.id,
    };
