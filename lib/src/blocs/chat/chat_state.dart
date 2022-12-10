part of 'chat_bloc.dart';

class ChatState {
  final bool isLoading;
  final bool hasError;
  final String? error;
  final bool succeeded;

  final Chat chat;

  const ChatState({
    required this.isLoading,
    required this.hasError,
    required this.error,
    required this.succeeded,
    required this.chat,
  });
  const ChatState.init({
    this.isLoading = false,
    this.hasError = false,
    this.error,
    this.succeeded = false,
    this.chat = const Chat.init(),
  });
  ChatState copyWith({
    bool? isLoading,
    bool? hasError,
    String? error,
    bool? succeeded,
    Chat? chat,
  }) {
    return ChatState(
      isLoading: isLoading ?? this.isLoading,
      hasError: hasError ?? this.hasError,
      error: error ?? this.error,
      succeeded: succeeded ?? this.succeeded,
      chat: chat ?? this.chat,
    );
  }

  ChatState loadingState() {
    return ChatState(
      isLoading: true,
      hasError: false,
      error: null,
      succeeded: false,
      chat: chat,
    );
  }

  ChatState errorState(String? error) {
    return ChatState(
      isLoading: false,
      hasError: true,
      error: error ?? this.error,
      succeeded: false,
      chat: chat,
    );
  }

  ChatState successState({Chat? chat}) {
    return ChatState(
      isLoading: false,
      hasError: false,
      error: null,
      succeeded: true,
      chat: chat ?? this.chat,
    );
  }
}
