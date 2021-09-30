import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:lucky_parking/data/api/api.dart';
import 'package:lucky_parking/data/repositories/login_repository_impl.dart';
import 'package:lucky_parking/domain/repositories/login_repository.dart';
import 'package:lucky_parking/domain/usecases/login_usecase.dart';
import 'package:lucky_parking/login/bloc/login_bloc.dart';
import 'package:lucky_parking/navigation/app_navigator.dart';
import 'package:lucky_parking/navigation/navigator.dart';

GetIt sl = GetIt.instance;

init() {
  sl.registerLazySingleton<AppNavigator>(() => AppNavigator());
  sl.registerLazySingleton<Navigator>(() => sl.get<AppNavigator>());

  sl.registerFactory<LoginCubit>(() => LoginCubit(loginUseCase: sl<LoginUserCase>(), navigator: sl()));

  sl.registerFactory<LoginUserCase>(() => LoginUserCase(loginRepository: sl<LoginRepository>()));

  sl.registerLazySingleton<LoginRepository>(() => LoginRepositoryImpl(api: sl()));

  sl.registerLazySingleton<Api>(() {
    final dio = Dio(); // Provide a dio instance
    dio.options.connectTimeout = 3000;
    dio.options.sendTimeout = 3000;
    dio.options.receiveTimeout = 3000;
    dio.interceptors.add(LogInterceptor());
    return Api(dio);
  });
}
