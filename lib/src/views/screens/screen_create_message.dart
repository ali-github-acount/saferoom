import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saferoom/src/blocs/chat/chat_bloc.dart';
import 'package:saferoom/src/views/screens/screen_messages.dart';

class ScreenCreateMessage extends StatelessWidget {
  static const String path = '${ScreenMessages.path}/create';
  const ScreenCreateMessage({super.key});

  @override
  Widget build(BuildContext context) {
    final formkey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        actions: [
          ElevatedButton(
              onPressed: () {
                final state = formkey.currentState;
                if (state?.validate() == true) {
                  state?.save();
                  context.read<ChatCubit>().send();
                }
              },
              child: const Text("Send"))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: formkey,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(hintText: "to:"),
                onSaved: context.read<ChatCubit>().setRecieverId,
              ),
              TextFormField(
                minLines: 1,
                maxLines: 100,
                decoration: const InputDecoration(hintText: "Message"),
                onSaved: context.read<ChatCubit>().setMessage,
              )
            ],
          ),
        ),
      ),
    );
  }
}
