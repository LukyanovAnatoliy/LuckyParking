import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lucky_parking/login/bloc/login_bloc.dart';
import 'package:lucky_parking/login/bloc/login_state.dart';
import 'package:lucky_parking/res/string_res.dart';

class LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final loginBloc = context.read<LoginCubit>();

    return BlocBuilder<LoginCubit, LoginState>(builder: (context, state) {
      return Container(
        alignment: const Alignment(0, -1 / 3),
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [

            TextField(
              decoration: InputDecoration(
                labelText: StringResources.LOGIN_PAGE_LOGIN_LABEL,
                border: OutlineInputBorder(),
                errorText: state.loginError,
              ),
              onChanged: loginBloc.onChangeLogin,
            ),

            Padding(padding: EdgeInsets.all(8)),

            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: StringResources.LOGIN_PAGE_PASSWORD_LABEL,
                border: OutlineInputBorder(),
                errorText: state.passwordError,
              ),
              onChanged: loginBloc.onChangePassword,
            ),

            Padding(padding: EdgeInsets.all(8)),

            Container(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => loginBloc.login(),
                child: const Text(StringResources.LOGIN_PAGE_BUTTON_LABEL),
              ),
            ),

          ],
        ),
      );
    });
  }
}
