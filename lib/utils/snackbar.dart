import 'package:flutter/material.dart';

class GlobalSnackBar {
  static final GlobalKey<ScaffoldMessengerState> _scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

  static void show(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message, textAlign: TextAlign.center));
    _scaffoldMessengerKey.currentState?.showSnackBar(snackBar);
  }

  static GlobalKey<ScaffoldMessengerState> get scaffoldMessengerKey => _scaffoldMessengerKey;
}