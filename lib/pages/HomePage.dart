



import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:todo/Funcs/NotificationServices.dart';
import 'package:todo/Funcs/Task.dart';
import 'package:todo/Funcs/TaskController.dart';
import 'package:todo/UIs/theme.dart';
import 'package:todo/pages/AddTaskPage.dart'; 
import 'package:todo/widgets/Task_Tile.dart';
import 'package:todo/widgets/button.dart';




class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  late NotificationService NotifyHelper;
@override
  void initState() {
    NotifyHelper = NotificationService();
    NotifyHelper.initializationNotification();
    NotifyHelper.requestIOSPermissions();
  }

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

          showTask(context),



        ],
      ),
    );
  }


  AppBar _appBar(context) {
    return AppBar(
      leading: IconButton(onPressed: () {
        NotifyHelper.displayNotification(Title: "Notifacation", body: "Zbi Manga");
        NotifyHelper.scheduledNotification();
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

 showTask(BuildContext context){
    return  Expanded(
         child: GestureDetector(
           onTap: (){
             print("PRESSED");
             showBottomSheet(context,Task(

               isCompleted: 0,
               title: 'Title 1',
               note : "Note ONE!",
               StartTime : "22:07",
               EndTime : "23:07",
               color : 0,
             ),
             );
           },
           child: TaskTile(task: Task(
                id:1,
                isCompleted: 1,
                title: 'Title 1',
               note : "Note ONE!",
            StartTime : "22:07",
           EndTime : "23:07",
                color : 0,
           ),),
         ),
      );



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

 showBottomSheet(BuildContext context, Task task){
    Get.bottomSheet(
      SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(top: 4),
          color: Get.isDarkMode ? darkHeaderClr : Colors.white,
          child: Column(
            children: [

              Flexible(child: Container(
                height: 6,
                width: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Get.isDarkMode ? Colors.grey[600] : Colors.grey[300],
                ),
              )),
              const SizedBox(height: 20),
              task.isCompleted ==1?
                  Container() :
                  _buildBottomSheet(label: "Task Completed", onTap: Get.back, clr: primaryClr),
                _buildBottomSheet(label: "Delete Task", onTap: Get.back, clr: primaryClr),
               Divider(color: Get.isDarkMode ? Colors.grey : darkGreyClr,),
               _buildBottomSheet(label: "Cancel Task", onTap: Get.back, clr: primaryClr),



              const SizedBox(height: 20,),


            ],
          ),
        )

      )
    );


 }
 _buildBottomSheet({
    required String label,
   required Function() onTap,
   required  Color clr,
   bool isClose = false,
}){

    return GestureDetector(

    onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 4),
        height: 65,
       child: Center(
         child: Text(label),
       ),


      ),

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











