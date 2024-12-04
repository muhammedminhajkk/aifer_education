import 'dart:io';

import 'package:aifer_education_machine_test/core/utils/snack_bar_utils.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionService {
  static Future<void> requestPermission() async {
    // Check if permission is granted
    PermissionStatus status = await Permission.storage.request();

    if (status != PermissionStatus.granted) {
      SnackBarUtils.showMessage('Permission Denied');
    }
  }

  static Future directory() async {
    final downloadsDirectory = Directory('storage/emulated/0/Download');

    if (!await downloadsDirectory.exists()) {
      await downloadsDirectory.create();
    }
    return downloadsDirectory;
  }
}
