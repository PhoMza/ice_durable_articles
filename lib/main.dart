import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ice_durable_articles/repository/authentication_repository/authentication_repository.dart';
import 'package:ice_durable_articles/routes.dart';
import 'package:ice_durable_articles/users/authentication/welcome_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  //firebase
  // Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
  //     .then((value) => Get.put(AuthenticationRepository()));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: GetRoutes.welcome,
      getPages: GetRoutes.routes,
      // home: WelcomeScreen(),
    );
  }
}

