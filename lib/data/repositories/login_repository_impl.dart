import 'package:lucky_parking/data/api/api.dart';
import 'package:lucky_parking/data/model/login_result_model.dart';
import 'package:lucky_parking/domain/repositories/login_repository.dart';

class LoginRepositoryImpl implements LoginRepository {

  final Api _api;

  LoginRepositoryImpl({required Api api}) : this._api = api;

  @override
  Future<LoginResultModel> login(String login, String password) {
    return _api.login();
  }
  
}