

import 'dart:js';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:todo/Funcs/theme_services.dart';
import 'package:todo/UIs/NotificationScreen.dart';
import 'package:todo/UIs/theme.dart';
import 'package:todo/pages/AddTaskPage.dart';
import 'package:todo/widgets/InputText.dart';
import 'package:todo/widgets/button.dart';

bool x = false;
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: _appBar(context),


    body: Column(
      children: [

        MyButton(label: "Add Task", onTap: () {
          Get.to(const AddTask(),);
        },

        ),
        const InputField(hint: "Enter Pass",head: "Nothing",Input: null,GetIcon:null ,readOnly: false,),
      ],
    ),
    );
  }



  AppBar _appBar (context){
    return AppBar(
      leading:  IconButton(onPressed: () {
        Get.back();}, icon:  Icon(


        Get.isDarkMode?
        Icons.wb_sunny_outlined : Icons.nightlight_outlined,color: Get.isDarkMode? Colors.white : darkGreyClr,size: 24,),


      ),
      elevation: 0,
      backgroundColor: context.theme.backgroundColor,
      actions: const [
        CircleAvatar(
          backgroundImage: NetworkImage("https://img.freepik.com/premium-vector/man-avatar-profile-round-icon_24640-14044.jpg?w=740"),
          radius: (18),
        ),
        SizedBox(width: 12,),
      ],
    );
  }
}



