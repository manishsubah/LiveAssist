import 'dart:math';

import 'package:flutter/material.dart';
//import 'package:zego_uiki/zego_uiki.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

final userId = Random().nextInt(9999).toString();

class CallPage extends StatelessWidget {
  const CallPage({Key? key, required this.callID}) : super(key: key);
  final String callID;

  @override
  Widget build(BuildContext context) {
    return ZegoUIKitPrebuiltCall(
      appID: 161855204, // Fill in the appID that you get from ZEGOCLOUD Admin Console.
      appSign: '5f1a71aaab9f23b02441a936ed33a281bc87f9cd7319b789c1a8ef37fc17457a', // Fill in the appSign that you get from ZEGOCLOUD Admin Console.
      userID: userId,
      userName: 'UserName $userId',
      callID: callID,
      // You can also use groupVideo/groupVoice/oneOnOneVoice to make more types of calls.
      config: ZegoUIKitPrebuiltCallConfig.oneOnOneVideoCall(),
    );
  }
}