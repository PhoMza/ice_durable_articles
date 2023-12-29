import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ice_durable_articles/controllers/signup_controller.dart';
import 'package:ice_durable_articles/routes.dart';
import 'package:ice_durable_articles/users/authentication/login_screen.dart';
import 'package:http/http.dart' as http;

class SignUpScreen extends StatefulWidget {
  SignUpScreen({super.key});

  //controller สำหรับ link data
  final controller = Get.put(SignUpController());

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final FocusNode _focusNode = FocusNode();
  // final controller = Get.put(SignUpController());
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final isKeyboard = MediaQuery.of(context).viewInsets.bottom != 0;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8.0),
        child: GetBuilder<SignUpController>(// link data จากตรงนี้ด้วย
            builder: (controller) {
          // link data
          return Column(
            children: <Widget>[
              if (!isKeyboard)
                Stack(
                  children: <Widget>[
                    Container(
                      height: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            offset: Offset(0.0, 2.0),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(30.0),
                        child: Image.asset(
                          "assets/logo_main.jpg",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              SizedBox(
                height: 10,
              ),
              Text(
                "ลงทะเบียน",
                style: TextStyle(
                    color: Color.fromARGB(255, 204, 36, 24),
                    fontSize: 40,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 214, 213, 213),
                    border: Border.all(
                      color: Color.fromARGB(255, 155, 152, 152),
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 10,
                      right: 10,
                    ),
                    //firebase
                    child: Form(
                      key: _formKey,
                      //firebase
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              FocusScope.of(context).requestFocus(_focusNode);
                            },
                            child: TextFormField(
                              focusNode: _focusNode,
                              controller:
                                  controller.nameController, // link data
                              decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  icon: Icon(
                                    Icons.person,
                                    color: Color.fromARGB(255, 72, 70, 70),
                                  ),
                                  hintText: "ชื่อผู้ใช้/รหัสนักศึกษา",
                                  hintStyle: TextStyle(
                                    color: Color.fromARGB(255, 72, 70, 70),
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 214, 213, 213),
                    border: Border.all(
                      color: Color.fromARGB(255, 155, 152, 152),
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 10,
                      right: 10,
                    ),
                    child: TextFormField(
                      controller: controller.emailController, // link data

                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          icon: Icon(
                            Icons.mail,
                            color: Color.fromARGB(255, 72, 70, 70),
                          ),
                          hintText: "อีเมล",
                          hintStyle: TextStyle(
                            color: Color.fromARGB(255, 72, 70, 70),
                          )),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 214, 213, 213),
                    border: Border.all(
                      color: Color.fromARGB(255, 155, 152, 152),
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 10,
                      right: 10,
                    ),
                    child: TextFormField(
                      controller: controller.passwordController, // link data
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          icon: Icon(
                            Icons.lock,
                            color: Color.fromARGB(255, 72, 70, 70),
                          ),
                          hintText: "รหัสผ่าน",
                          hintStyle: TextStyle(
                            color: Color.fromARGB(255, 72, 70, 70),
                          ),
                          suffixIcon: Icon(
                            Icons.remove_red_eye,
                            color: Color.fromARGB(255, 72, 70, 70),
                          )),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 214, 213, 213),
                    border: Border.all(
                      color: Color.fromARGB(255, 155, 152, 152),
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 10,
                      right: 10,
                    ),
                    child: TextFormField(
                      controller: controller.confirmPasswordController, // link data
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          icon: Icon(
                            Icons.lock,
                            color: Color.fromARGB(255, 72, 70, 70),
                          ),
                          hintText: "ยืนยัน รหัสผ่าน",
                          hintStyle: TextStyle(
                            color: Color.fromARGB(255, 72, 70, 70),
                          ),
                          suffixIcon: Icon(
                            Icons.remove_red_eye,
                            color: Color.fromARGB(255, 72, 70, 70),
                          )),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 25,
                  vertical: 10,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 90, vertical: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: MaterialButton(
                        color: const Color.fromARGB(255, 204, 36, 24),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        onPressed: () {
                          controller.checkSignUp();
                        },
                        // if (_formKey.currentState!.validate()) {}
                        //firebase
                        // if (_formKey.currentState!.validate()) {
                        //   SignUpController.instance.registerUser(
                        //       controller.email.text.trim(),
                        //       controller.password.text.trim());
                        // }
                        //firebase
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(
                            "ยืนยัน",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "คุณมีบัญชีแล้วใช่ไหม ",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(GetRoutes.login);
                      // Navigator.push(context,
                      //     MaterialPageRoute(builder: (context) => LoginScreen()));
                    },
                    child: Text(
                      "เข้าสู่ระบบ",
                      style: TextStyle(
                        color: Colors.redAccent,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              )
            ],
          );
        }),
      ),
    );
  }
}
