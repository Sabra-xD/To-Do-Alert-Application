import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:todo/UIs/NotificationScreen.dart';

class NotificationService {


  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();

  requestIOSPermissions(){
    flutterLocalNotificationsPlugin.
    resolvePlatformSpecificImplementation
    <IOSFlutterLocalNotificationsPlugin>(
    )?.requestPermissions(
        sound: true,
        alert: true,
        badge: true
    );
  }


  initializationNotification() async{

    tz.initializeTimeZones();
    // tz.setLocalLocation(tz.getLocation(timeZoneName));



    final AndroidInitializationSettings initializationSettingsAndroid =
     const AndroidInitializationSettings('app_icon'); //Add Icon name
    final IOSInitializationSettings initializationSettingsIOS =
    IOSInitializationSettings(
      requestSoundPermission: false,
      requestBadgePermission: false,
      requestAlertPermission: false,
      onDidReceiveLocalNotification: onDidReceiveLocalNotification,
    );



    final InitializationSettings initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid,
        iOS: initializationSettingsIOS);
    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification:(String? payload) async {
        selectNotification(payload!);
        });




  }

  void selectNotification(String payload) async {
    if (payload != null) {
      debugPrint('notification payload: $payload');
    }
    await Get.to(NotificationScreen(payload: payload));
  }

  displayNotification({required String Title,required String body,}) async {

    AndroidNotificationDetails androidPlatformChannelSpecifics =
      const AndroidNotificationDetails('your channel id', 'your channel name', 'your channel description',
        importance: Importance.max,
        priority: Priority.high,
        showWhen: false);


    IOSNotificationDetails iosPlatformChannelSpecifics =
    const IOSNotificationDetails();
     NotificationDetails platformChannelSpecifics =
    NotificationDetails(android: androidPlatformChannelSpecifics, iOS: iosPlatformChannelSpecifics);

     //DISPLAY NOTIFICATINOS
    await flutterLocalNotificationsPlugin.show(
        0, Title, body, platformChannelSpecifics,
        payload: 'Default_Sound');


  }


  scheduledNotification() async{

    await flutterLocalNotificationsPlugin.zonedSchedule(
        0,
        'scheduled title',
        'scheduled body',
        tz.TZDateTime.now(tz.local).add(const Duration(seconds: 5)),
        const NotificationDetails(
            android: AndroidNotificationDetails(
                'your channel id', 'your channel name','your channel description')),
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
        UILocalNotificationDateInterpretation.absoluteTime);


  }





   Future onDidReceiveLocalNotification(
      int? id, String? title, String? body, String? payload) async {

    Get.dialog(Text(body!));




    // display a dialog with the notification details, tap ok to go to another page
    // showDialog(
    //   context: context,
    //   builder: (BuildContext context) => CupertinoAlertDialog(
    //     title: Text(title),
    //     content: Text(body),
    //     actions: [
    //       CupertinoDialogAction(
    //         isDefaultAction: true,
    //         child: Text('Ok'),
    //         onPressed: () async {
    //           Navigator.of(context, rootNavigator: true).pop();
    //           await Navigator.push(
    //             context,
    //             MaterialPageRoute(
    //               builder: (context) => SecondScreen(payload),
    //             ),
    //           );
    //         },
    //       )
    //     ],
    //   ),
    // );
  }

}