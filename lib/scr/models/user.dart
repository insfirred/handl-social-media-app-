import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  final String username;
  final String email;
  @JsonKey(name: 'date_created')
  final DateTime dateCreated;

  const User({
    required this.username,
    required this.email,
    required this.dateCreated,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
