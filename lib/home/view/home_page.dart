import 'package:flutter/material.dart';
import 'package:lucky_parking/res/string_res.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(StringResources.APP_NAME),
      ),
    );
  }
}
