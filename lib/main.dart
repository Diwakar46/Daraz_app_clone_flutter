import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:rest_api_flutter/constants/theme.dart';
import 'package:rest_api_flutter/screens/HomeScreen./home_page.dart';
import 'package:get/get.dart';

void main() {
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(textTheme: myTextTheme()),
    home: HomePage(),
  ));
}

    // List<GetPage<dynamic>>? getPages,
    // List<Route<dynamic>> Function(String)? onGenerateInitialRoutes,