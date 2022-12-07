import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:saferoom/src/blocs/auth/auth_bloc.dart';
import 'package:saferoom/src/constans.dart';
import 'package:saferoom/src/views/screens/screen_sign_in.dart';

class FormSignUp extends StatelessWidget {
  FormSignUp({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final name = BlocBuilder<AuthBloc, AuthState>(
      buildWhen: (prev, cur) => prev.user.name != cur.user.name,
      builder: (context, state) {
        return Flexible(
          child: TextFormField(
            decoration: InputDecoration(
                label: Text(getLabelName, style: SRTextStyle.label)),
            initialValue: state.user.name,
            onSaved: context.read<AuthBloc>().setName,
          ),
        );
      },
    );
    final lastname = BlocBuilder<AuthBloc, AuthState>(
      buildWhen: (prev, cur) => prev.user.lastname != cur.user.lastname,
      builder: (context, state) {
        return Flexible(
          child: TextFormField(
            decoration: InputDecoration(
                label: Text(getLabelFamilyName, style: SRTextStyle.label)),
            initialValue: state.user.lastname,
            onSaved: context.read<AuthBloc>().setLastname,
          ),
        );
      },
    );
    final email = BlocBuilder<AuthBloc, AuthState>(
      buildWhen: (prev, cur) => prev.user.email != cur.user.email,
      builder: (context, state) {
        return TextFormField(
          decoration: InputDecoration(
              label: Text(getLabelEmail, style: SRTextStyle.label)),
          initialValue: state.user.email,
          onSaved: context.read<AuthBloc>().setEmail,
        );
      },
    );
    final password = TextFormField(
      decoration: InputDecoration(
          label: Text(getLabelPassword, style: SRTextStyle.label)),
      onSaved: context.read<AuthBloc>().setPassword,
    );
    final signUpBtn = Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            minimumSize: const Size(double.maxFinite, 45)),
        onPressed: () => signUp(context),
        child: Text(getButtonSignUp, style: SRTextStyle.button),
      ),
    );
    final fullname = SizedBox(
      child: Row(children: [name, const SizedBox(width: 10), lastname]),
    );
    final signInMsg = TextButton(
      onPressed: () => context.push(ScreenSignIn.path),
      child: Text(getButtonSignInMsg, style: SRTextStyle.buttonV2),
    );

    return Container(
      padding: const EdgeInsets.all(10),
      child: Form(
          key: _formKey,
          child: Column(
            children: [fullname, email, password, signUpBtn, signInMsg],
          )),
    );
  }

  void signUp(BuildContext context) {
    final state = _formKey.currentState;
    if (state?.validate() == true) {
      state?.save();

      context.read<AuthBloc>().signup();
    }
  }
}
