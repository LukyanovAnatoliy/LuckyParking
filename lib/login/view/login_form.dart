import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lucky_parking/login/bloc/login_bloc.dart';
import 'package:lucky_parking/login/bloc/login_state.dart';
import 'package:lucky_parking/res/string_res.dart';

const _BUTTON_HEIGHT = 40.0;

class LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final loginBloc = context.read<LoginCubit>();
    return BlocConsumer<LoginCubit, LoginState>(
      builder: (context, state) {
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
                child: state is LoginInProgressState
                    ? _getWaitButton()
                    : _getLoginButton(() => loginBloc.login()),
              ),
            ],
          ),
        );
      },
      listener: (context, state) {
        if (state is LoginServerException) {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errorMessage),
              )
          );
        }
      },
    );
  }

  Widget _getWaitButton() {
    return SizedBox(
      height: _BUTTON_HEIGHT,
      child: ElevatedButton(
        onPressed: () {},
        child: SizedBox(
          height: 25,
          width: 25,
          child: CircularProgressIndicator(
            color: Colors.white,
            strokeWidth: 3,
          ),
        ),
      ),
    );
  }

  Widget _getLoginButton(void Function() loginAction) {
    return SizedBox(
      height: _BUTTON_HEIGHT,
      child: ElevatedButton(
        onPressed: loginAction,
        child: Text(StringResources.LOGIN_PAGE_BUTTON_LABEL),
      ),
    );
  }
}
