import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/UIs/NotificationScreen.dart';
import 'package:todo/UIs/theme.dart';



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
      themeMode: ThemeMode.dark,
      home: const NotificationScreen(payload: "Title | Desc | 10:45",),
    );
  }
}
