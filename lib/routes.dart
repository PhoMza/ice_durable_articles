import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ice_durable_articles/api_model/asset_historyborrow_model.dart';
import 'package:ice_durable_articles/screen/search_page.dart';
import 'package:ice_durable_articles/screen/tabbar/tabbar_main.dart';
import 'package:ice_durable_articles/test%20Home%20page%20student%20Admin/home_historyBorrow.dart';
import 'package:ice_durable_articles/users/authentication/login_screen.dart';
import 'package:ice_durable_articles/users/authentication/signup_screen.dart';
import 'package:ice_durable_articles/users/authentication/welcome_screen.dart';

class GetRoutes {
  static const String welcome = '/welcome'; // หน้าแรก
  static const String login = '/login'; // หน้าล็อกอิน
  static const String signup = '/signup'; // หน้าสมัครสมาชิก
  // static const String homestudent = '/home'; // หน้าแรก
  static const String home = '/home'; // หน้าแรก

  static List<GetPage> routes = [
    GetPage(name: GetRoutes.welcome, page: () => WelcomeScreen()),
    GetPage(name: GetRoutes.login, page: () => LoginScreen()),
    GetPage(name: GetRoutes.signup, page: () => SignUpScreen()),
    GetPage(name: GetRoutes.home, page: () => TabBarScreen2()),
    // GetPage(name: GetRoutes.home, page: () => SearchPageScreen()),
  ];
}