import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ice_durable_articles/src/color_strings.dart';

customSnackbar(title, message, type) {
  Get.snackbar(
    title,
    message,
    snackPosition: SnackPosition.TOP,
    backgroundColor: type == "error"? Colors.red:Colors.green,
    colorText: Colors.white,
  );
}
