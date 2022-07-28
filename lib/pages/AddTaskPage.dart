
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:todo/widgets/InputText.dart';
import 'package:todo/widgets/button.dart';
import 'package:todo/Funcs/TaskController.dart';
import 'package:todo/UIs/theme.dart';




class AddTask extends StatefulWidget {
  const AddTask({Key? key}) : super(key: key);

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  final TaskController _taskController = Get.put(TaskController());
  int _selectedColor = 0;
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();

  DateTime _selectedDate = DateTime.now();
  String _startTime = DateFormat('hh:mm a').format(DateTime.now()).toString();
  String _endTime = DateFormat('hh:mm a').format(DateTime.now().add(const Duration(minutes: 15))).toString();

  int _selectedRemind = 5;
  List<int> remindList = [5,10,15,20];
  String _selectedRepeat = 'None';
  List<String> repeatList = ['None','Daily','Weekly','Monthly'];



  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: _appBar(),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 7),
        child: SingleChildScrollView(
          child: Column(

            children: [

              SizedBox(height:15),
              InputField(readOnly: false,Input: _titleController, hint: "Enter your Title", head: "Title"),
              SizedBox(height:15),
              InputField(readOnly: false,Input: _noteController, hint: "Enter your Description", head: "Description", GetIcon: Icon(Icons.note_add_outlined,color: Colors.grey,),),

              SizedBox(height:15),
              InputField(readOnly: false,Input: null, hint: DateFormat.yMd().format(_selectedDate), head: "Date",GetIcon:IconButton(onPressed: (){}, icon: const Icon(Icons.calendar_today_outlined,color: Colors.grey,))),
              SizedBox(height:15),

              Row(
                children: [
                Expanded(child:  InputField(readOnly: false,Input: null, hint: _startTime, head: "Start Time",
                 GetIcon:IconButton(onPressed: (){}, icon: const Icon(Icons.access_time_rounded,color: Colors.grey,))),
               ),
                  SizedBox(width: 20,),

                  Expanded(child:  InputField(readOnly: false,Input: null, hint: _endTime, head: "End Time",
                      GetIcon:IconButton(onPressed: (){}, icon: const Icon(Icons.access_time_rounded,color: Colors.grey,))),
                    ),


                  ],
              ),






              InputField(Input: null, hint: _selectedRemind.toString(), head: "Reminder", readOnly: true,



                GetIcon: DropdownButton(
                  borderRadius: BorderRadius.circular(10),
                  dropdownColor: Colors.blueGrey,
                  items: remindList.map((value) => DropdownMenuItem(
                  value : value,
                  child: Text('$value',
                    style: const TextStyle(
                        color: Colors.white
                    ),),)).toList(), onChanged:(int? newValue){
                   setState(() {
                     _selectedRemind = newValue!;
                   });
                },

                  icon:const Icon(Icons.arrow_downward_outlined,color: Colors.grey,),
                  iconSize: 32,
                  elevation: 4,
                  underline: Container(height: 0,),),


              ),








          const SizedBox(height: 20,),



              InputField(Input: null, hint: _selectedRepeat, head: "Repeat", readOnly: true,

                GetIcon: DropdownButton(
                  borderRadius: BorderRadius.circular(10),
                  dropdownColor: Colors.blueGrey,
                  items: repeatList.map((value) => DropdownMenuItem(
                    value : value,
                    child: Text('$value',
                      style: const TextStyle(
                          color: Colors.white
                      ),),)).toList(), onChanged:(String? newValue){
                   setState(() {
                     _selectedRepeat = newValue!;
                   });

                },
                  icon:const Icon(Icons.arrow_downward_outlined,color: Colors.grey,),
                  iconSize: 32,
                  elevation: 4,
                  underline: Container(height: 0,),),

              ),
             const SizedBox(height: 18,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  _colourPalate(),
                  Column(
                    children: const [
                      Text("Color",style: TextStyle(color: Colors.white),),


                    ],
                  ),

                  MyButton(label: "Save Task", onTap: (){
                    Get.back();
                  })
                ],
              )
            ],


          ),
        ),
      ),
    ));


  }
  AppBar _appBar (){
    return AppBar(
      leading:  IconButton(onPressed: () {
        Get.back();}, icon:  Icon(Icons.arrow_back_ios,color: Get.isDarkMode? Colors.white : darkGreyClr,size: 24,),


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

  Column _colourPalate() {
    return Column(
      children: [
        const Text("Color",style: TextStyle(
            color: Colors.black
        )),

        Wrap(
          children: List.generate(3, (index) => GestureDetector(
            onTap: (){
               setState(() {
                 _selectedColor = index;
               });
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 8),
              child: CircleAvatar(
                child: _selectedColor == index? const Icon(Icons.done,size: 16,
                  color: Colors.white,): null,
                backgroundColor: index == 0? Colors.purple :
                index == 1? Colors.pinkAccent :
                Colors.orange,
                radius: 14,

              ),
            ),
          ),
          ),
        ),
      ],
    );


  }

}

