import 'package:saferoom/src/api/chat_api.dart';
import 'package:saferoom/src/models/entities/chat.dart';

class ChatRepo {
  final ChatApi _chatApi;

  ChatRepo(ChatApi chatApi) : _chatApi = chatApi;

  Future<bool> send(Chat chat) {
    return _chatApi.send(chat);
  }

  Future<bool> recieve(Chat chat) {
    return _chatApi.recieve(chat);
  }
}
