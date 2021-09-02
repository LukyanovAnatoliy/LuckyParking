import 'package:lucky_parking/domain/entity/login_result.dart';
import 'package:lucky_parking/domain/repositories/login_repository.dart';
import 'package:lucky_parking/domain/usecases/base_usecase.dart';


class LoginUserCase implements UseCase<LoginResult, LoginParams> {

  final LoginRepository _loginRepository;

  LoginUserCase({required loginRepository}) : this._loginRepository = loginRepository;

  @override
  Future<LoginResult> call(LoginParams params) async {
    final loginResult = await _loginRepository.login(params.login, params.password);
    print(loginResult.toJson());
    return Future.value(LoginResult());
  }

}

class LoginParams{
  final String login;
  final String password;

  LoginParams({required this.login, required this.password});

}