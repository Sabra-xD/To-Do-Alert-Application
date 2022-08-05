

import 'dart:js';

import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:todo/Funcs/TaskController.dart';
import 'package:todo/UIs/theme.dart';
import 'package:todo/pages/AddTaskPage.dart';
import 'package:todo/widgets/SizeConfig.dart';
import 'package:todo/widgets/button.dart';



bool x = false;
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final  TaskController _taskController = Get.put(TaskController());
  DateTime _selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: _appBar(context),


      body: Column(
        children: [

          // MyButton(label: "Add Task", onTap: () {
          //   Get.to(const AddTask(),);
          SizedBox(height: 5,),

           _addTask(),

          _addDateBar(),

          _showTask(),

        ],
      ),
    );
  }


  AppBar _appBar(context) {
    return AppBar(
      leading: IconButton(onPressed: () {
        Get.back();
      }, icon: Icon(


        Get.isDarkMode ?
        Icons.wb_sunny_outlined : Icons.nightlight_outlined,
        color: Get.isDarkMode ? Colors.white : darkGreyClr, size: 24,),


      ),
      elevation: 0,
      // backgroundColor: context.theme.backgroundColor,
      backgroundColor: Colors.black,
      actions: const [
        CircleAvatar(
          backgroundImage: NetworkImage(
              "https://img.freepik.com/premium-vector/man-avatar-profile-round-icon_24640-14044.jpg?w=740"),
          radius: (18),
        ),
        SizedBox(width: 12,),
      ],
    );
  }

 _showTask(){
    return Expanded(
       child: _NoTask(),
    );

    //     child: Obx(() => if(_taskController.TaskList.isEmpty){
    //  _NoTask();
    // }else {
    // Text("You don't have any tasks yet :/",style: Themes().TitleStyle,);
    // })
    // );
 }

 _NoTask(){
    return SingleChildScrollView(
      child:Wrap(
        alignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        direction: Axis.horizontal, //Change Axis later to be dynamic see what happens each time.
        children: [
          // SizeConfigs.orientation ==  Orientation.landscape ? const SizedBox(height: 50,) : const SizedBox(height:220),
          SvgPicture.network("https://mightymamma.com/wp-content/uploads/2019/03/Tink-Happy-Thoughts.svg",
          height: 90,
          color: primaryClr.withOpacity(0.5),),
          Padding(padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 7),
          child: Text("There are currently no listings :/",style: Themes().TitleStyle,),),

        ],
      ),
    );
 }

 _addDateBar() {
    return Container(
     margin: const EdgeInsets.symmetric(horizontal: 10),
      child: DatePicker(
        DateTime.now(),
        width: 80,
        height: 100,
        selectedTextColor: Colors.white,
        selectionColor: primaryClr,
       dateTextStyle: Themes().DateStyle,
       monthTextStyle: Themes().DateStyle,
       dayTextStyle:Themes().DateStyle,
       initialSelectedDate: DateTime.now(),
       onDateChange: (newDate){
          setState(() {
            _selectedDate = newDate;
          });
       },
      ) ,
    );

 }
 }










Row _addTask() {
  List<String> months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];

  var now = new DateTime.now();
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [

       Container(
         margin: EdgeInsets.symmetric(horizontal: 5),
         child: Column(
           children: [


             Text(months[now.month-1]+'-'+DateFormat('dd-yyyy').format(now).toString(),
                 style: Themes().TitleStyle),
             Text("Today",style: Themes().TitleStyle),

           ],
         ),
       ),



      Container(
        width: 200,
        child: MyButton(label: "Add Task +", onTap: (){
          Get.to(AddTask());
        }),
      )

    ],
  );
}









