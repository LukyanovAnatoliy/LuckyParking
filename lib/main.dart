import 'package:flutter/material.dart';
import 'package:lucky_parking/di/service_locator.dart' as di;
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
      home: LoginPage(),
    );
  }
}