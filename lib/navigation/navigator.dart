import 'screens/app_screen.dart';

abstract class Navigator {

  void navigateTo(AppScreen screen);

  void navigateToNewMainScreen(AppScreen screen);

  void back();

}