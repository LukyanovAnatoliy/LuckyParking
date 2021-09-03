import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:lucky_parking/di/service_locator.dart' as di;
import 'package:lucky_parking/home/view/home_page.dart';
import 'package:lucky_parking/navigation/app_navigator.dart';
import 'package:lucky_parking/navigation/screens/app_screen.dart';
import 'package:lucky_parking/navigation/state/navigate_state.dart';
import 'package:lucky_parking/res/string_res.dart';

import 'login/view/login_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: StringResources.APP_NAME,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocListener<AppNavigator, NavigateState>(
        bloc: GetIt.I.get<AppNavigator>(),
        listener: (context, state) {
          if (state is NavigateToNewMainScreenState) {
            switch (state.screen) {
              case AppScreen.HOME:
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => HomePage(),
                    ));
                break;
              case AppScreen.LOGIN:
                break;
            }
          } else if (state is NavigateToScreenState) {
            switch (state.screen) {
              case AppScreen.HOME:
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => HomePage(),
                    ));
                break;
              case AppScreen.LOGIN:
                break;
            }
          }
        },
        child: LoginPage(),
      ),
    );
  }
}
