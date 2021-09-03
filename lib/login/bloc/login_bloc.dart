import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lucky_parking/domain/usecases/login_usecase.dart';
import 'package:lucky_parking/login/bloc/login_state.dart';
import 'package:lucky_parking/navigation/navigator.dart';
import 'package:lucky_parking/navigation/screens/app_screen.dart';
import 'package:lucky_parking/res/string_res.dart';

const _MIN_LENGTH_PASSWORD = 4;

class LoginCubit extends Cubit<LoginState> {
  String _currentPassword = "";
  String _currentLogin = "";

  final LoginUserCase _loginUseCase;
  final Navigator _navigator;

  LoginCubit({required LoginUserCase loginUseCase, required Navigator navigator})
      : this._loginUseCase = loginUseCase,
        this._navigator = navigator,
        super(LoginEmptyState());

  onChangePassword(String newPassword) {
    _currentPassword = newPassword;
  }

  onChangeLogin(String newLogin) {
    _currentLogin = newLogin;
  }

  login() async {
    if (_checkData()) {
      print("$_currentLogin: $_currentPassword");
      emit(LoginInProgressState());
      final loginResult = await _loginUseCase(LoginParams(login: _currentLogin, password: _currentPassword));
      if (loginResult.isSuccess) {
        emit(LoginEmptyState());
        _navigator.navigateToNewMainScreen(AppScreen.HOME);
      } else {
        print("error");
      }
    }
  }

  bool _checkData() {
    String? loginCheckMessage;
    String? passwordCheckMessage;
    if (_currentLogin.isEmpty) {
      loginCheckMessage = StringResources.LOGIN_PAGE_LOGIN_ERROR_EMPTY;
    }

    if (_currentPassword.isEmpty) {
      passwordCheckMessage = StringResources.LOGIN_PAGE_PASSWORD_ERROR_EMPTY;
    } else if (_currentPassword.length < _MIN_LENGTH_PASSWORD) {
      passwordCheckMessage = StringResources.LOGIN_PAGE_PASSWORD_ERROR_SHORT;
    }

    if (loginCheckMessage != null || passwordCheckMessage != null) {
      emit(LoginInvalidDataState(loginError: loginCheckMessage, passwordError: passwordCheckMessage));
      return false;
    }

    return true;
  }
}
