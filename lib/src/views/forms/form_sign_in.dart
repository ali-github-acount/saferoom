import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:saferoom/src/blocs/auth/auth_bloc.dart';
import 'package:saferoom/src/views/screens/screen_sign_up.dart';

class FormSignIn extends StatelessWidget {
  FormSignIn({super.key});

  final formKey = GlobalKey<FormState>();

  void signIn(BuildContext context) {
    final state = formKey.currentState;
    if (state?.validate() == true) {
      state?.save();
      context.read<AuthBloc>().signin();
    }
  }

  @override
  Widget build(BuildContext context) {
    final email = BlocBuilder<AuthBloc, AuthState>(
      buildWhen: (prev, cur) => prev.user.email != cur.user.email,
      builder: (context, state) {
        return TextFormField(
          initialValue: state.user.email,
          onSaved: context.read<AuthBloc>().setEmail,
        );
      },
    );
    final password = TextFormField(
      onSaved: context.read<AuthBloc>().setPassword,
    );
    final signInBtn = ElevatedButton(
      onPressed: () => signIn,
      child: Text(tr("signIn.signInBtn")),
    );
    final signUpMsg = TextButton(
      onPressed: () => context.go(ScreenSignUp.path),
      child: Text(tr("signIn.signUpMsg")),
    );
    return Form(
        key: formKey,
        child: Column(
          children: [email, password, signInBtn, signUpMsg],
        ));
  }
}
