import 'package:freezed_annotation/freezed_annotation.dart';

part 'message.g.dart';

@JsonSerializable()
class Message {
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  final String from;
  final String to;
  @JsonKey(name: 'message_text')
  final String messageText;
  final String? id;

  Message({
    required this.createdAt,
    required this.from,
    required this.to,
    required this.messageText,
    this.id,
  });

  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);
  Map<String, dynamic> toJson() => _$MessageToJson(this);
}
