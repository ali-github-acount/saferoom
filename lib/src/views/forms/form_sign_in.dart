import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:saferoom/src/blocs/auth/auth_bloc.dart';
import 'package:saferoom/src/views/screens/screen_sign_up.dart';

class FormSignIn extends StatelessWidget {
  FormSignIn({super.key});

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final email = BlocBuilder<AuthBloc, AuthState>(
      buildWhen: (prev, cur) => prev.user.email != cur.user.email,
      builder: (context, state) {
        return TextFormField(
          decoration: InputDecoration(label: Text(tr("signIn.emailLabel"))),
          initialValue: state.user.email,
          onSaved: context.read<AuthBloc>().setEmail,
        );
      },
    );
    final password = TextFormField(
      decoration: InputDecoration(label: Text(tr("signIn.passwordLabel"))),
      onSaved: context.read<AuthBloc>().setPassword,
    );
    final signInBtn = Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            minimumSize: const Size(double.maxFinite, 45)),
        onPressed: () => signIn(context),
        child: Text(tr("signIn.signInBtn")),
      ),
    );
    final signUpMsg = TextButton(
      onPressed: () => context.push(ScreenSignUp.path),
      child: Text(tr("signIn.signUpMsg")),
    );
    return Container(
      padding: const EdgeInsets.all(10),
      child: Form(
          key: formKey,
          child: Column(
            children: [email, password, signInBtn, signUpMsg],
          )),
    );
  }

  void signIn(BuildContext context) {
    final state = formKey.currentState;
    if (state?.validate() == true) {
      state?.save();
      context.read<AuthBloc>().signin();
    }
  }
}
