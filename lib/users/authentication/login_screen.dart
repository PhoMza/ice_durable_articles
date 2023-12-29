import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ice_durable_articles/controllers/login_controller.dart';
import 'package:ice_durable_articles/routes.dart';
// import 'package:ice_durable_articles/users/authentication/signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController _emailController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();
    bool _obscureText = true;
    final TextInputType keyboardTypeEmail = TextInputType.emailAddress;
    final TextInputType keyboardTypePassword = TextInputType.visiblePassword;

    final loginController = Get.put(LoginController());

    //firebase
    // final controller = Get.put(LoginController());
    // final _loginFormKey = GlobalKey<FormState>();
    final isKeyboard = MediaQuery.of(context).viewInsets.bottom != 0;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8.0),
        child: GetBuilder<LoginController>(builder: (controller) {
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
                "เข้าสู่ระบบ",
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
                    
                    child: Form(
                      
                      child: Column(
                        children: [
                          TextFormField(
                            controller: controller.emailController,
                            keyboardType: keyboardTypeEmail,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              labelText: 'อีเมล',
                              hintStyle: TextStyle(
                                color: Color.fromARGB(255, 72, 70, 70),
                              ),
                              icon: Icon(
                                Icons.person,
                                color: Color.fromARGB(255, 72, 70, 70),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
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
                      obscureText: _obscureText,
                      controller: controller.passwordController,
                      keyboardType: keyboardTypePassword,
                      validator: (value) {
                        if (value!.isEmpty) return 'โปรดใส่รหัสผ่าน';
                        return null;
                      },
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        icon: Icon(
                          Icons.lock,
                          color: Color.fromARGB(255, 72, 70, 70),
                        ),
                        labelText: 'รหัสผ่าน',
                        suffixIcon: IconButton(
                          color: Color.fromARGB(255, 72, 70, 70),
                          icon: Icon(_obscureText
                              ? Icons.visibility_off
                              : Icons.visibility),
                          onPressed: () {
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                        ),
                      ),
                    ),
                    // child: TextFormField(
                    //   obscureText: _obscureText,
                    //   controller: _passwordController,
                    //   validator: (value) {
                    //     if (value!.isEmpty) return 'โปรดใส่รหัสผ่าน';
                    //     return null;
                    //   },
                    //   decoration: const InputDecoration(
                    //       border: InputBorder.none,
                    //       icon: Icon(
                    //         Icons.lock,
                    //         color: Color.fromARGB(255, 72, 70, 70),
                    //       ),
                    //       hintText: "รหัสผ่าน",
                    //       hintStyle: TextStyle(
                    //         color: Color.fromARGB(255, 72, 70, 70),
                    //       ),
                    //       suffixIcon: Icon(
                    //         Icons.remove_red_eye,
                    //         color: Color.fromARGB(255, 72, 70, 70),
                    //       )),
                    // ),
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
                child: Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    //ลืมรหัสผ่าน
                    onTap: () {},
                    child: Text(
                      "ลืมรหัสผ่าน",
                      style: TextStyle(
                        color: Color.fromARGB(255, 204, 36, 24),
                      ),
                    ),
                  ),
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
                          controller.checkLogin();
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          // ปุมเข้าสู่ระบบ
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
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     Text(
              //       "คุณยังไม่มีบัญชีใช่ไหม ",
              //       style: TextStyle(
              //         fontSize: 16,
              //         fontWeight: FontWeight.w500,
              //       ),
              //     ),
              //     GestureDetector(
              //       onTap: () {
              //         Get.toNamed(GetRoutes.signup);
              //         // Navigator.push(context,
              //         //     MaterialPageRoute(builder: (context) => SignUpScreen()));
              //       },
              //       child: Text(
              //         "ลงทะเบียน",
              //         style: TextStyle(
              //           color: Colors.redAccent,
              //           fontSize: 16,
              //         ),
              //       ),
              //     ),
              //   ],
              // )
            ],
          );
        }),
      ),
    );
  }
}
