import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/DemoPage.dart';
import 'package:news_app/HomePageController.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';


import 'Config/Theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'News App',
      theme: lightTheme,
      themeMode: ThemeMode.system,
      darkTheme: darkTheme,
      //home: HomePageController(),
      home: DemoPage(),
    );
  }
}
