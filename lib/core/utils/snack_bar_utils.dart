import 'package:aifer_education_machine_test/main.dart';
import 'package:flutter/material.dart';

class SnackBarUtils {
  static void showMessage(String message) {
    MyApp.scaffoldMessengerKey.currentState?.showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }
}
