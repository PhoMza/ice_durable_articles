import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ice_durable_articles/api_connection/api_connection.dart';
import 'package:ice_durable_articles/repository/authentication_repository/authentication_repository.dart';
import 'package:ice_durable_articles/routes.dart';
import 'package:ice_durable_articles/screen/tabbar/tabbar_main.dart';
import 'package:ice_durable_articles/test%20Home%20page%20student%20Admin/home_historyBorrow.dart';
import 'package:ice_durable_articles/users/authentication/widget/loader.dart';
import 'package:ice_durable_articles/api_model/user.dart';
import 'package:ice_durable_articles/api_connection/base_url.dart';
import 'package:ice_durable_articles/utils_of_login/custom_snackbar.dart';
import 'package:http/http.dart' as http;
import 'package:ice_durable_articles/utils_of_login/shared_prefs.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Textfield รับข้อมูลจาก Text field
class LoginController extends GetxController {
  late TextEditingController emailController, passwordController;

  @override
  void onInit() {
    super.onInit();
    checkUser();

    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  checkUser() async {
    var user = await SharedPerfs().getUser();
    if (user != null) {
      Get.offAllNamed(GetRoutes.home);
    }
  }

  @override
  void onClose() {
    super.onClose();

    emailController.dispose();
    passwordController.dispose();
  }

  checkLogin() {
    if (emailController.text.isEmpty ||
        GetUtils.isEmail(emailController.text) == false) {
      customSnackbar("โปรดใส่", "อีเมลของคุณ", "error");
    } else if (passwordController.text.isEmpty) {
      customSnackbar("โปรดใส่", "รหัสผ่าน", "error");
    } else {
      Get.showOverlay(asyncFunction: () => login(), loadingWidget: Loader());
    }
  }

  login() async {
    //API
    // var respone = await http.post(Uri.parse(API.serviceUrlHTTP + '/ice_project/login.php'), body: {
    var respone = await http.post(
        Uri.parse(API.serviceUrlHTTP + '/ice_project_borrow/login.php'),
        body: {
          //ของอาจารย์
          // var respone = await http.post(Uri.parse(API.base_url + '/login.php'), body: {
          // //เรา
          "email": emailController.text,
          "password": passwordController.text,
        });

    var res = await json.decode(respone.body);

    if (res['success']) {  // aaa

      customSnackbar("สำเร็จ", res['message'], "success");

      User user = User.fromJson(res['user']); // link data
      print(res['message']);
      print("เรียกจาก login calltroller ");
      print(user.user_id);
      print(user.name);
      print(user.email);
      print(user.role);

      await SharedPerfs().storeUser(json.encode(user));

      Get.offAllNamed(GetRoutes.home);
      // MaterialPageRoute route = MaterialPageRoute(
      //     builder: (context) => TabBarScreen2(
      //         //  user_id: user.user_id.toString(),
      //         ));
      //
    } else {
      customSnackbar("ไม่สำเร็จ", res['message'], "error");
    } // aaa
  }
}
// static LoginController get instance => Get.find();

// /// TextField Controllers to get data from TextFields
// final email = TextEditingController();
// final password = TextEditingController();

// get showPassword => null;

// /// TextField Validation

// //Call this Function from Design & it will do the rest
// Future<void> login() async {
//   String? error = await AuthenticationRepository.instance
//       .loginWithEmailAndPassword(email.text.trim(), password.text.trim());
//   if (error != null) {
//     Get.showSnackbar(GetSnackBar(
//       message: error.toString(),
//     ));
//   }
// }
