import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ice_durable_articles/users/authentication/login_screen.dart';
import 'package:ice_durable_articles/users/authentication/signup_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    // final isKeyboard = MediaQuery.of(context).viewInsets.bottom != 0;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              // if (!isKeyboard)
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
            height: 2,
          ),
          const Spacer(),
          Text(
            "ICE",
            style: TextStyle(
                color: Color.fromARGB(255, 204, 36, 24),
                fontSize: 80,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 2,
          ),
          Text("Information and Communication Engineering"),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 90, vertical: 20),
            child: Row(
              children: [
                Expanded(
                  child: MaterialButton(
                    color: const Color.fromARGB(255, 204, 36, 24),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    onPressed: () {
                      Get.to(() => LoginScreen());
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        "เข้าสู่ระบบ",
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
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 90, vertical: 20),
          //   child: Row(
          //     children: [
          //       Expanded(
          //         child: MaterialButton(
          //           color: const Color.fromARGB(255, 204, 36, 24),
          //           shape: RoundedRectangleBorder(
          //               borderRadius: BorderRadius.circular(15)),
          //           onPressed: () {
          //             Get.to(() => SignUpScreen());
          //             // Get.to(SignUpScreen());
          //           },
          //           child: Padding(
          //             padding: const EdgeInsets.all(12.0),
          //             child: Text(
          //               "ลงทะเบียน",
          //               style: TextStyle(
          //                 color: Colors.white,
          //                 fontSize: 20,
          //               ),
          //             ),
          //           ),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          const Spacer(),
          GestureDetector(
            onTap: () {},
            child: const Text(
              "Phetchaburi Rajabhat University",
              style: TextStyle(
                color: Color.fromARGB(255, 204, 36, 24),
              ),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
