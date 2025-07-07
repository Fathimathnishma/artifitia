import 'package:flutter/material.dart';

import '../../../main.dart';

class EasyNavigation {
  static Future<void> push({
    required BuildContext context,
    required Widget page,
    // PageTransitionType type = PageTransitionType.fade,
  }) async {
    await Navigator.push(
        navigatorKey.currentState?.context ?? context,
        MaterialPageRoute(
          builder: (context) => page,
        ));
  }

  static Future<void> pushReplacement({
    required BuildContext context,
    required Widget page,
    // PageTransitionType type = PageTransitionType.fade,
  }) async {
    await Navigator.pushReplacement(
        navigatorKey.currentState?.context ?? context,
        MaterialPageRoute(
          builder: (context) => page,
        ));
  }

  static Future<void> pop({
    required BuildContext context,
  }) async {
    Navigator.of(navigatorKey.currentState?.context ?? context).pop();
  }

  static Future<void> pushAndRemoveUntil({
    required BuildContext context,
    required Widget page,
    // PageTransitionType type = PageTransitionType.fade,
  }) async {
    await Navigator.pushAndRemoveUntil(
      navigatorKey.currentState?.context ?? context,
      MaterialPageRoute(builder: (context) => page),
      (Route<dynamic> route) => false,
    );
  }
}
