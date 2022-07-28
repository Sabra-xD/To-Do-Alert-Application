import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/Funcs/theme_services.dart';
import 'package:todo/UIs/NotificationScreen.dart';
import 'package:todo/UIs/theme.dart';
import 'package:todo/pages/AddTaskPage.dart';
import 'package:todo/pages/HomePage.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: Themes.Light,
      darkTheme: Themes.Dark,
      themeMode: Theme_Services().theme,
      home: AddTask(),
    );
  }
}
