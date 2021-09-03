import 'package:lucky_parking/navigation/screens/app_screen.dart';

abstract class NavigateState{}

class NavigateToScreenState implements NavigateState {
  final AppScreen screen;

  NavigateToScreenState({required this.screen});
}

class NavigateToNewMainScreenState implements NavigateState {
  final AppScreen screen;

  NavigateToNewMainScreenState({required this.screen});
}
