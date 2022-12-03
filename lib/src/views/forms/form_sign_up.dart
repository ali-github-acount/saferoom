import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:saferoom/src/blocs/auth/auth_bloc.dart';
import 'package:saferoom/src/views/screens/screen_sign_up.dart';

class FormSignUp extends StatelessWidget {
  FormSignUp({super.key});

  final _formKey = GlobalKey<FormState>();

  void signUp(BuildContext context) {
    final state = _formKey.currentState;
    if (state?.validate() == true) {
      state?.save();
      context.read<AuthBloc>().signup();
    }
  }

  @override
  Widget build(BuildContext context) {
    final name = BlocBuilder<AuthBloc, AuthState>(
      buildWhen: (prev, cur) => prev.user.name != cur.user.name,
      builder: (context, state) {
        return TextFormField(
          initialValue: state.user.name,
          onSaved: context.read<AuthBloc>().setName,
        );
      },
    );
    final lastname = BlocBuilder<AuthBloc, AuthState>(
      buildWhen: (prev, cur) => prev.user.lastname != cur.user.lastname,
      builder: (context, state) {
        return TextFormField(
          initialValue: state.user.lastname,
          onSaved: context.read<AuthBloc>().setLastname,
        );
      },
    );
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
    final signUpBtn = ElevatedButton(
      onPressed: () => signUp(context),
      child: Text(tr("signUp.signUpBtn")),
    );
    final signInMsg = TextButton(
      onPressed: () => context.push(ScreenSignUp.path),
      child: Text(tr("signUp.signInMsg")),
    );
    return Form(
        key: _formKey,
        child: Column(
          children: [name, lastname, email, password, signUpBtn, signInMsg],
        ));
  }
}
