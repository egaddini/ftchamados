import 'dart:convert';

class ChatMessage {

  int? id;
  String chatId;
  String senderId;
  String recipientId;
  String content;
  int data;

  ChatMessage({
    this.id,
    required this.chatId,
    required this.senderId,
    required this.recipientId, 
    required this.content,
    required this.data,
  });

  

  ChatMessage copyWith({
    int? id,
    String? chatId,
    String? senderId,
    String? recipientId,
    String? content,
    int? data,
  }) {
    return ChatMessage(
      id: id ?? this.id,
      chatId: chatId ?? this.chatId,
      senderId: senderId ?? this.senderId,
      recipientId: recipientId ?? this.recipientId,
      content: content ?? this.content,
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'chatId': chatId,
      'senderId': senderId,
      'recipientId': recipientId,
      'content': content,
      'data': data,
    };
  }

  factory ChatMessage.fromMap(Map<String, dynamic> map) {
    return ChatMessage(
      id: map['id'] as int,
      chatId: map['chatId'] as String,
      senderId: map['senderId'] as String,
      recipientId: map['recipientId'] as String,
      content: map['content'] as String,
      data: map['data'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory ChatMessage.fromJson(String source) => ChatMessage.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ChatMessage(id: $id, chatId: $chatId, senderId: $senderId, recipientId: $recipientId, content: $content, data: $data)';
  }

  @override
  bool operator ==(covariant ChatMessage other) {
    
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.chatId == chatId &&
      other.senderId == senderId &&
      other.recipientId == recipientId &&
      other.content == content &&
      other.data == data;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      chatId.hashCode ^
      senderId.hashCode ^
      recipientId.hashCode ^
      content.hashCode ^
      data.hashCode;
  }
  
}
