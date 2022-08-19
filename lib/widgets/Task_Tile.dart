

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo/Funcs/Task.dart';
import 'package:todo/UIs/theme.dart';
import 'package:todo/widgets/SizeConfig.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({Key? key, required this.task}) : super(key: key);
  final Task task;

  @override
  Widget build(BuildContext context) {
    return Padding(

      padding: EdgeInsets.symmetric(horizontal: 8),
        child: Container(
          margin: const EdgeInsets.only(bottom: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: _getColor(task.color),
          ),
          child: Row(
            children: [
              Expanded(child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text('${task.title}',style:GoogleFonts.lato(
                        textStyle: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[200],
                        )
                    ),),
                    const SizedBox(height: 5),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(Icons.access_time_rounded),
                        const SizedBox(width: 8,),
                        Text('${task.StartTime} - ${task.EndTime}',
                          style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                  fontSize: 13,
                                  color: Colors.grey[100],
                              )
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 5),
                    Text('${task.note}',style: GoogleFonts.lato(
                        textStyle: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[250],
                        )
                    ),)
                  ],
                ),
              )),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                width: 0.5,height: 60,
              color: Colors.grey[200]!.withOpacity(0.7),),
              RotatedBox(quarterTurns: 3,
              child: Text(task.isCompleted == 0? 'TODO' : "Completed",
              style: GoogleFonts.lato(
                  textStyle: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  )
              ),),),
            ],
          ),
        ));
  }

  _getColor(int? color){
    switch(color){
      case(0):
        return bluishClr;
      case(1):
        return pinkClr;
      case(2):
        return orangeClr;
      default:
        return bluishClr;


    }
  }

}
