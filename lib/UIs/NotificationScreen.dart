import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/Funcs/theme_services.dart';
import 'package:todo/UIs/theme.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key, required this.payload}) : super(key: key);
final String payload;
  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}


class _NotificationScreenState extends State<NotificationScreen> {
  String _payload = '';
  @override
  void initState() {
    _payload = widget.payload;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {
          Get.back();}, icon: const Icon(Icons.arrow_back_ios),
        ),
        elevation: 0,
        backgroundColor: context.theme.backgroundColor,
      title: Center(
        child: Text(
          _payload.toString().split('|')[0],
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w900,
              color: Get.isDarkMode? Colors.white : darkGreyClr,
            )
        ),
      ),
        actions: [
          IconButton(onPressed: () {
            Theme_Services().SwitchThemes();}, icon:  Icon(Theme_Services().GetIt() ? Icons.dark_mode : Icons.light_mode),
          ),
        ],

      ),
          body: SafeArea(child: Column(
            children: [
              const SizedBox(height: 20,),
              Text('Hello!',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w900,
                color: Get.isDarkMode? Colors.white : darkGreyClr,
              ),),
              const SizedBox(height: 10,),
              Text('You have a new reminder!',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w300,
                  color: Get.isDarkMode? Colors.grey : darkGreyClr,
                ),),


              Expanded(

                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 10),
                  margin: const EdgeInsets.symmetric(horizontal: 30,),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: primaryClr,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Row(
                       children: const [
                          Icon(
                          Icons.text_format,
                          color: Colors.white,
                            size: 30,
                        ),
                          SizedBox(width: 30,),
                         Text('Title',
                           style: TextStyle(
                             fontSize: 30,
                             fontWeight: FontWeight.w300,
                             color: Colors.grey,
                           ),),
                    ]
                      ),
                      const SizedBox(height: 20,),
                      Text(
                          _payload.toString().split('|')[0],
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w900,
                            color: Colors.white,

                          ),
                        textAlign: TextAlign.justify,
                      ),
                      const SizedBox(height: 20,),
                      Row(
                          children: const [
                            Icon(
                              Icons.description,
                              color: Colors.white,
                              size: 30,
                            ),
                            SizedBox(width: 20,),
                            Text('Description',
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w300,
                                color: Colors.grey,
                              ),),
                          ]
                      ),
                      const SizedBox(height: 20,),
                      Text(
                        _payload.toString().split('|')[1],
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                          color: Colors.white,

                        ),
                        textAlign: TextAlign.justify,
                      ),
                      const SizedBox(width: 20,),
                      Row(
                          children: const [
                            Icon(
                              Icons.calendar_today_outlined,
                              color: Colors.white,
                              size: 30,
                            ),
                            SizedBox(width: 20,),
                            Text('Date',
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w300,
                                color: Colors.grey,
                              ),),
                          ]
                      ),

                      const SizedBox(width: 20,),

                      Text(
                        _payload.toString().split('|')[2],
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                          color: Colors.white,

                        ),

                      ),
                    ],
              ),
                  ),
                ),)

            ],
          ),

          ),
    );
  }
}
