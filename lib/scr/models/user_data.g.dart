// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserData _$UserDataFromJson(Map<String, dynamic> json) => UserData(
      id: json['id'] as String,
      username: json['username'] as String,
      email: json['email'] as String,
      dateCreated: DateTime.parse(json['date_created'] as String),
      imageUrl: json['image_url'] as String?,
    );

Map<String, dynamic> _$UserDataToJson(UserData instance) => <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'email': instance.email,
      'date_created': instance.dateCreated.toIso8601String(),
      'image_url': instance.imageUrl,
    };
