
import 'package:dio/dio.dart';
import 'package:lucky_parking/data/model/login_result_model.dart';
import 'package:retrofit/http.dart';

part 'api.g.dart';

@RestApi(baseUrl: "https://backend.production.faulab.ru/rest")
abstract class Api {
  factory Api(Dio dio, {String baseUrl}) = _Api;

  @GET("/hello")
  Future<LoginResultModel> login();
}