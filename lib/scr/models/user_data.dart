import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_data.g.dart';

@JsonSerializable()
class UserData {
  final String id;
  final String username;
  final String email;
  @JsonKey(name: 'date_created')
  final DateTime dateCreated;
  @JsonKey(name: 'image_url')
  final String? imageUrl;

  const UserData({
    required this.id,
    required this.username,
    required this.email,
    required this.dateCreated,
    this.imageUrl,
  });

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);
  Map<String, dynamic> toJson() => _$UserDataToJson(this);
}
