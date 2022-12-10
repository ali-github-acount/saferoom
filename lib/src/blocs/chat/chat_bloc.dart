import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saferoom/src/repositories/repo_chat.dart';

import '../../models/entities/chat.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  final ChatRepo _chatRepo;
  ChatCubit(ChatRepo chatRepo)
      : _chatRepo = chatRepo,
        super(const ChatState.init());

  void setSenderId(String? id) {
    emit(
      state.copyWith(
        chat: state.chat.copyWith(
          senderId: id,
        ),
      ),
    );
  }

  void setRecieverId(String? id) {
    emit(
      state.copyWith(
        chat: state.chat.copyWith(
          recieverId: id,
        ),
      ),
    );
  }

  void setMessage(String? messages) {
    state.chat.messages.add(messages);
  }

  void send() async {
    emit(state.loadingState());
    try {
      _chatRepo.send(state.chat);
      emit(state.successState());
    } catch (e) {
      emit(state.errorState('$e'));
    }
  }

  void recieve() async {
    emit(state.loadingState());
    try {
      _chatRepo.recieve(state.chat);
      emit(state.successState());
    } catch (e) {
      emit(state.errorState('$e'));
    }
  }
}
