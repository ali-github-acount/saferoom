class Chat {
  final String? cId;
  final String? senderId;
  final String? recieverId;
  final List<String?> messages;

  const Chat({
    required this.cId,
    required this.senderId,
    required this.recieverId,
    required this.messages,
  });
  const Chat.init({
    this.cId,
    this.senderId,
    this.recieverId,
    this.messages = const [],
  });

  Chat copyWith({
    String? cId,
    String? senderId,
    String? recieverId,
    List<String?>? messages,
  }) {
    return Chat(
        cId: cId ?? this.cId,
        senderId: senderId ?? this.senderId,
        recieverId: recieverId ?? this.recieverId,
        messages: messages ?? this.messages);
  }

  Map<String, dynamic> toMap() {
    var json = <String, dynamic>{
      'cId': cId,
      'senderId': senderId,
      'recieverId': recieverId,
      'messages': messages,
    };
    json.removeWhere((key, value) => value == null);
    return json;
  }

  factory Chat.fromMap(Map<String, dynamic>? map) {
    if (map == null) return const Chat.init();
    return Chat(
      cId: map['cId'],
      senderId: map['senderId'],
      recieverId: map['recieverId'],
      messages: map['messages'],
    );
  }

  static List<Chat> listFromMap(List? list) {
    if (list == null || list.isEmpty) return const [];
    return list.map((e) => Chat.fromMap(e)).toList();
  }
}
