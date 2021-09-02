abstract class LoginState {
  final String? loginError;
  final String? passwordError;

  LoginState({this.loginError, this.passwordError});
}

class LoginEmptyState extends LoginState {
  LoginEmptyState() : super();
}

class LoginInProgressState extends LoginState {
  LoginInProgressState() : super();
}

class LoginInvalidDataState extends LoginState {
  LoginInvalidDataState({loginError, passwordError})
      : super(loginError: loginError, passwordError: passwordError);
}

class LoginServerException extends LoginState {
  final String errorMessage;

  LoginServerException({this.errorMessage = ""}) : super();
}
