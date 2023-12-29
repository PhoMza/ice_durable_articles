import 'dart:convert'; //json
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ice_durable_articles/api_connection/api_connection.dart';
import 'package:ice_durable_articles/repository/authentication_repository/authentication_repository.dart';
import 'package:ice_durable_articles/routes.dart';
import 'package:ice_durable_articles/users/authentication/widget/loader.dart';
import 'package:ice_durable_articles/api_connection/base_url.dart';
import 'package:ice_durable_articles/utils_of_login/custom_snackbar.dart';
import 'package:http/http.dart' as http;

// Textfield รับข้อมูลจาก Text field
class SignUpController extends GetxController {
  late TextEditingController useridController,
      nameController,
      emailController,
      passwordController,
      confirmPasswordController;

  @override
  void onInit() {
    super.onInit();
    useridController = TextEditingController();
    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
  }

  @override
  void onClose() {
    super.onClose();
    useridController.dispose();
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
  }

  checkSignUp() {
    if (nameController.text.isEmpty) {
      customSnackbar("โปรดใส่", "ชื่อผู้ใช้", "error");
      return;
    } else if (useridController.text.isEmpty ||
        GetUtils.isEmail(useridController.text) == false) {
      customSnackbar("โปรดใส่", "รหัสนักศึกษา", "error");
    } else if (emailController.text.isEmpty ||
        GetUtils.isEmail(emailController.text) == false) {
      customSnackbar("โปรดใส่", "อีเมลของคุณ", "error");
    } else if (passwordController.text.isEmpty) {
      customSnackbar("โปรดใส่", "รหัสผ่าน", "error");
    } else if (passwordController.text != confirmPasswordController.text) {
      customSnackbar("โปรดใส่", "รหัสผ่านให้ตรงกัน", "error");
    } else {
      Get.showOverlay(asyncFunction: () => signup(), loadingWidget: Loader());
    }
  }

  signup() async {
    //link data
    var respone = await http
        .post(Uri.parse(API.serviceUrlHTTP + '/ice_project/signup.php'), body: {
      "userid": useridController.text,
      "name": nameController.text,
      "email": emailController.text,
      "password": passwordController.text,
    });

    var res = await json.decode(respone.body);

    if (res['success']) {
      customSnackbar("สำเร็จ", res['message'], "success");
      Get.offAllNamed(GetRoutes.welcome);
    } else {
      customSnackbar("Error", res['message'], "error");
    }
  }
}

  // static SignUpController get instance => Get.find();
  // final email = TextEditingController();
  // final password = TextEditingController();
  // final fullname = TextEditingController();
  // final phoneNo = TextEditingController();
//  เรียกฟังก์ชั่น จาก design
//   void registerUser(String email, String password) {
//     AuthenticationRepository.instance
//         .createUserWithEmailAndPassword(email, password);
//   }
// }
