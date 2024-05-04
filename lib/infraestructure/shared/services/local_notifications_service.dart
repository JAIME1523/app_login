import 'package:flutter/material.dart';

class LocalNotificationsService {
  static GlobalKey<ScaffoldMessengerState> messagerKey =
      GlobalKey<ScaffoldMessengerState>();

  static showSnackbar(String message) async {
    messagerKey.currentState!.clearSnackBars();

    final snackbar = Text(
      message,
      style: const TextStyle(color: Colors.white, fontSize: 15),
    );

    messagerKey.currentState!.showSnackBar(SnackBar(content: snackbar));
  }
}
