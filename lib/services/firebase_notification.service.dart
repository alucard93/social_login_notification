import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';

class FirebaseNotificationService {
  Future<void> initialize() async {
    await FirebaseMessaging.instance.requestPermission();
    final fcmToken = await FirebaseMessaging.instance.getToken();

    if (kDebugMode) {
      debugPrint('FCM_TOKEN: $fcmToken');
    }
  }
}
