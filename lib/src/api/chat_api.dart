import 'package:saferoom/src/models/entities/chat.dart';

abstract class ChatApi {
  Future<bool> send(Chat chat);
  Future<bool> recieve(Chat chat);
}
