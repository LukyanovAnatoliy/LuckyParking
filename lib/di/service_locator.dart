import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:lucky_parking/data/api/api.dart';
import 'package:lucky_parking/data/repositories/login_repository_impl.dart';
import 'package:lucky_parking/domain/repositories/login_repository.dart';
import 'package:lucky_parking/domain/usecases/login_usecase.dart';
import 'package:lucky_parking/login/bloc/login_bloc.dart';

GetIt sl = GetIt.instance;

init() {
  sl.registerFactory<LoginCubit>(() => LoginCubit(loginUseCase: sl<LoginUserCase>()));

  sl.registerFactory<LoginUserCase>(() => LoginUserCase(loginRepository: sl<LoginRepository>()));

  sl.registerLazySingleton<LoginRepository>(() => LoginRepositoryImpl(api: sl()));

  sl.registerLazySingleton<Api>(() {
    final dio = Dio(); // Provide a dio instance
    dio.interceptors.add(LogInterceptor());
    return Api(dio);
  });
}
