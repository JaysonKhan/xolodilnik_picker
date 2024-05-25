// import 'dart:async';
// import 'dart:developer';
//
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:xolodilnik/core/data/singletons/storage.dart';
//
// StreamController<int> notificationGlobalController = StreamController.broadcast(sync: true);
//
// class PushNotification {
//   final _firebaseMessaging = FirebaseMessaging.instance;
//   final _localNotifications = FlutterLocalNotificationsPlugin();
//
//   final _androidChanel = const AndroidNotificationChannel(
//     'xolodilnik',
//     'Important Notification',
//     description: 'Bu orqali biz sizga kerakli axborotlarni yetkazib turamiz!',
//     importance: Importance.defaultImportance,
//   );
//
//   Future<void> initNotifications() async {
//     NotificationSettings settings = await _firebaseMessaging.requestPermission();
//     // if (Platform.isIOS) {
//     //   var token = await _firebaseMessaging.getAPNSToken();
//     //   if (token == null) {
//     //     await Future<void>.delayed(const Duration(seconds: 3));
//     //     token = await _firebaseMessaging.getAPNSToken();
//     //   } else {}
//     //   print('tokentoken: ${token}');
//     // } else {
//     //   final fcmToken = await _firebaseMessaging.getToken();
//     //   print('fcmToken: $fcmToken');
//     // }
//     final fcmToken = await _firebaseMessaging.getToken();
//     log('fcmToken: $fcmToken');
//
//     StorageRepository.putString('registration_id', fcmToken ?? '');
//
//     FirebaseMessaging.onBackgroundMessage((message) => backgroundHandler(message));
//
//     FirebaseMessaging.onMessage.listen(
//       (message) {
//         final notification = message.notification;
//         notificationGlobalController.add(1);
//         AndroidNotification? android = message.notification?.android;
//
//         if (notification == null) return;
//         _localNotifications.show(
//           notification.hashCode,
//           notification.title,
//           notification.body,
//           NotificationDetails(
//             android: AndroidNotificationDetails(
//               _androidChanel.id,
//               _androidChanel.name,
//               channelDescription: _androidChanel.description,
//               icon: '@mipmap/ic_launcher',
//             ),
//             iOS: const DarwinNotificationDetails(),
//           ),
//           // payload: jsonEncode(message.toMap()),
//         );
//       },
//     );
//   }
// }
//
// Future<void> backgroundHandler(RemoteMessage message) async {
//   print('XXX Handling a title ${message.notification?.title}');
//   print('Handling a body ${message.notification?.body}');
//   print('Handling a data ${message.data}');
// }
