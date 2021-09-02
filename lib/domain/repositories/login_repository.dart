import 'package:lucky_parking/data/model/login_result_model.dart';

abstract class LoginRepository {

  Future<LoginResultModel> login(String login, String password);

}