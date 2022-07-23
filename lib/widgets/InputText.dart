
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/Funcs/theme_services.dart';
import 'package:todo/UIs/theme.dart';

class InputField extends StatelessWidget {
  const InputField({Key? key, required this.Input, required this.hint, required this.head, this.GetIcon}) : super(key: key);
  final TextEditingController? Input;
  final String hint;
  final String head;
  final Icon? GetIcon;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Text(head,style: Themes().TitleStyle),
         const SizedBox(height: 10,),
        Container(
          //padding: const EdgeInsets.only(top: 8),
          margin: const EdgeInsets.symmetric(horizontal: 14),
          height: 52,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color:  Colors.black12,
          ),
          child: TextField(
            cursorColor: Get.isDarkMode? Colors.grey[100] : Colors.grey[400],
            controller: Input,
            obscureText: false,
            decoration: InputDecoration(
              prefixIcon: GetIcon ,
              hintText: hint,
              hintStyle: TextStyle(fontSize: 20.0, color: Colors.redAccent)
            ),

          ),
        ),
      ],
    );
  }
}
