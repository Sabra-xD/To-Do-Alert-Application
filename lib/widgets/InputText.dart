
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/Funcs/theme_services.dart';
import 'package:todo/UIs/theme.dart';

class InputField extends StatelessWidget {
  const InputField({Key? key, required this.Input, required this.hint, required this.head, this.GetIcon, required this.readOnly}) : super(key: key);
  final TextEditingController? Input;
  final String hint;
  final String head;
  final Widget? GetIcon;
  final bool readOnly;


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Text(head,style: Themes().TitleStyle),
         const SizedBox(height: 10,),

        Container(
          padding: const EdgeInsets.only(left: 8),
          margin: const EdgeInsets.only(top: 14),
          height: 52,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color:  Colors.black12,
          ),
          child: TextField(
            readOnly: readOnly,
            cursorColor: Get.isDarkMode? Colors.grey[100] : Colors.grey[400],
            controller: Input,
            obscureText: false,
            decoration: InputDecoration(
              suffixIcon: GetIcon,
             // prefixIcon: GetIcon ,
              hintText: hint,
              hintStyle: TextStyle(fontSize: 20.0, color: Colors.redAccent)
            ),

          ),
        ),
      ],
    );
  }
}
