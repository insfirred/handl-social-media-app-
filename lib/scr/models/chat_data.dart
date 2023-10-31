import 'package:freezed_annotation/freezed_annotation.dart';

import 'message.dart';

part 'chat_data.g.dart';

@JsonSerializable()
class ChatData {
  @JsonKey(name: 'all_messages_list')
  final List<Message> allMessagesList;
  @JsonKey(name: 'last_message')
  final Message lastMessage;
  @JsonKey(name: 'user1')
  final String user1;
  @JsonKey(name: 'user2')
  final String user2;

  ChatData({
    required this.allMessagesList,
    required this.lastMessage,
    required this.user1,
    required this.user2,
  });

  factory ChatData.fromJson(Map<String, dynamic> json) =>
      _$ChatDataFromJson(json);
  Map<String, dynamic> toJson() => _$ChatDataToJson(this);
}
