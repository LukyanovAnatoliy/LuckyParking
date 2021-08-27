import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lucky_parking/login/bloc/login_bloc.dart';
import 'package:lucky_parking/login/view/login_form.dart';
import 'package:lucky_parking/res/string_res.dart';

class LoginPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(StringResources.APP_NAME),
        ),
        body: BlocProvider<LoginCubit>(
          create: (_) => LoginCubit(),
          child: LoginForm(),
        )
    );
  }
}
