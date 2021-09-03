import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lucky_parking/navigation/navigator.dart';
import 'package:lucky_parking/navigation/screens/app_screen.dart';
import 'package:lucky_parking/navigation/state/navigate_state.dart';

class AppNavigator extends Cubit<NavigateState> implements Navigator {
  AppNavigator() : super(NavigateToNewMainScreenState(screen: AppScreen.LOGIN));

  @override
  void back() {
    //
  }

  @override
  void navigateTo(AppScreen screen) {
    emit(NavigateToScreenState(screen: screen));
  }

  @override
  void navigateToNewMainScreen(AppScreen screen) {
    emit(NavigateToNewMainScreenState(screen: screen));
  }


}
