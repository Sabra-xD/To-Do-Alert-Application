import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:todo/UIs/NotificationScreen.dart';

class NotificationService {
  tz.initializeTimeZones();
  tz.setLocalLocation(tz.getLocation(timeZoneName));

  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();
  const AndroidInitializationSettings initializationSettingsAndroid =
  AndroidInitializationSettings('app_icon');
  final IOSInitializationSettings initializationSettingsIOS =
  IOSInitializationSettings(
    requestSoundPermission: false,
    requestBadgePermission: false,
    requestAlertPermission: false,
    onDidReceiveLocalNotification: onDidReceiveLocalNotification,
  );
  final MacOSInitializationSettings initializationSettingsMacOS =
  MacOSInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false);
  final InitializationSettings initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
      macOS: initializationSettingsMacOS);
  await flutterLocalNotificationsPlugin.initialize(initializationSettings,
  onSelectNotification: onSelectNotification);









  void selectNotification(String payload) async {
    if (payload != null) {
      debugPrint('notification payload: $payload');
    }
    await Get.to(NotificationScreen(payload: payload));
  }













  const AndroidNotificationDetails androidPlatformChannelSpecifics =
  AndroidNotificationDetails('your channel id', 'your channel name',
      channelDescription: 'your channel description',
      importance: Importance.max,
      priority: Priority.high,
      ticker: 'ticker');
  const NotificationDetails platformChannelSpecifics =
  NotificationDetails(android: androidPlatformChannelSpecifics);
  await flutterLocalNotificationsPlugin.show(
  0, 'plain title', 'plain body', platformChannelSpecifics,
  payload: 'item x');



  await flutterLocalNotificationsPlugin.zonedSchedule(
  0,
  'scheduled title',
  'scheduled body',
  tz.TZDateTime.now(tz.local).add(const Duration(seconds: 5)),
  const NotificationDetails(
  android: AndroidNotificationDetails(
  'your channel id', 'your channel name',
  channelDescription: 'your channel description')),
  androidAllowWhileIdle: true,
  uiLocalNotificationDateInterpretation:
  UILocalNotificationDateInterpretation.absoluteTime);


  void onDidReceiveLocalNotification(
      int id, String title, String body, String payload) async {

    Get.dialog(Text(body));




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