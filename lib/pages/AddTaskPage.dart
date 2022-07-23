
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/widgets/InputText.dart';
import 'package:todo/widgets/button.dart';

class AddTaskPage extends StatelessWidget {
  const AddTaskPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        leading:  IconButton(onPressed: () {
          Get.back();}, icon: const Icon(Icons.arrow_back_ios),
        ),
        backgroundColor: context.theme.backgroundColor,

      ),
      body: SingleChildScrollView(
        child: Column(

          children: [
            MyButton(label: "Add Task", onTap: (){}),
            SizedBox(height:15),
            InputField(Input: null, hint: "Enter your Title", head: "Title"),
            SizedBox(height:15),
            InputField(Input: null, hint: "Enter your Date", head: "Date"),
            SizedBox(height:15),
            InputField(Input: null, hint: "Enter your Description", head: "Description"),

            SizedBox(height:15),

            SingleChildScrollView(
              child: Row(
                children: [
                  InputField(Input: null, hint: "Enter Start Time", head: "Start Time",GetIcon:Icon(Icons.access_alarm_outlined)),
                  SizedBox(width: 15,),
                  InputField(Input: null, hint: "Enter Start Time", head: "End Time",GetIcon:Icon(Icons.access_alarm_outlined),),
                ],
              ),
            )

          ],


        ),
      ),
    ));
  }
}
