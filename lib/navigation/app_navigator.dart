import 'package:flutter/material.dart';

class AppNavigator {
  static final navigatorKey = GlobalKey<NavigatorState>();

  push(Widget page) {
    Navigator.of(navigatorKey.currentState!.context).push(
      MaterialPageRoute(
        builder: (context) => page,
      ),
    );
  }
}
