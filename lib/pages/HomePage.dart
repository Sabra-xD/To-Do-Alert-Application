

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:todo/Funcs/theme_services.dart';
import 'package:todo/UIs/NotificationScreen.dart';
import 'package:todo/pages/AddTaskPage.dart';
import 'package:todo/widgets/InputText.dart';
import 'package:todo/widgets/button.dart';

bool x = false;
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:  IconButton(onPressed: () {
          Theme_Services().SwitchThemes();
          Get.to(const NotificationScreen(payload: "Title | Desc | 10:45",));}, icon: const Icon(Icons.arrow_back_ios),
        ),
        actions: [
          IconButton(onPressed: () {
            Theme_Services().SwitchThemes();
            }, icon:  Icon( Theme_Services().GetIt() ? Icons.dark_mode : Icons.light_mode),
          ),
        ],
      ),


    body: Column(
      children: [

        MyButton(label: "Add Task", onTap: () {
          Get.to(const AddTaskPage(),);
        },

        ),
        const InputField(hint: "Enter Pass",head: "Nothing",Input: null,GetIcon:null ,),
      ],
    ),
    );
  }
}



