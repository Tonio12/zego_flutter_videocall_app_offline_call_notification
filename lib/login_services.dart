import 'dart:async';
import 'dart:math';

import 'package:duochat/contants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
import 'package:zego_uikit_signaling_plugin/zego_uikit_signaling_plugin.dart';

final random = Random();

Future<void> login({
  required String userID,
  required String userName,
}) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setString(cacheUserIDKey, userID);

  currentUser.id = userID;
  currentUser.name = 'user_$userID';
}

/// on App's user login
void onUserLogin() {
  ZegoUIKitPrebuiltCallInvitationService().init(
      appID: 1850635844 /*input your AppID*/,
      appSign:
          '661eb5ff9892e711abfce2567accfe2ced97321fb0963bc361c633a6f351e691' /*input your AppSign*/,
      userID: currentUser.id,
      userName: currentUser.name,
      plugins: [ZegoUIKitSignalingPlugin()],
      notificationConfig: ZegoCallInvitationNotificationConfig(
        androidNotificationConfig: ZegoCallAndroidNotificationConfig(
          showFullScreen: true,
          channelID: "ZegoUIKit",
          channelName: "Call Notifications",
          sound: "call",
          icon: "call",
        ),
      ));
}

/// on App's user logout
void onUserLogout() {
  ZegoUIKitPrebuiltCallInvitationService().uninit();
}
