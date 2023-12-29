import 'package:firebase_auth/firebase_auth.dart';

import 'package:get/get.dart';
import 'package:ice_durable_articles/repository/authentication_repository/exceptions/login_email_password_failure.dart';
import 'package:ice_durable_articles/repository/authentication_repository/exceptions/signup_email_password_failure.dart';
import 'package:ice_durable_articles/screen/tabbar/tabbar_main.dart';
import 'package:ice_durable_articles/users/authentication/welcome_screen.dart';
import 'package:ice_durable_articles/screen/tabbar/tabbar_screen2.dart';

//หน้าสำหรับ data base
//firebase
class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  //variables ตัวแปร
  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;

  @override
  void onReady() {
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _setInitialSccreen);
  }

//ปิดหน้าทั้งหมด
  _setInitialSccreen(User? user) {
    user == null
        ? Get.offAll(() => WelcomeScreen())
        : Get.offAll(() => const TabBarScreen2());
  }

  Future<void> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      firebaseUser.value != null
          ? Get.offAll(() => const TabBarScreen2())
          : Get.to(() => WelcomeScreen());
    } on FirebaseAuthException catch (e) {
      final ex = SignUpWithEmailAndPasswordFailure.code(e.code);
      print('FIREBASE AUTH EXCEPTION - ${ex.message}');
      // throw ex;
    } catch (_) {
      const ex = SignUpWithEmailAndPasswordFailure();
      print('EXCEPTION - ${ex.message}');
      // throw ex;
    }
  }

  Future<String?> loginWithEmailAndPassword(
      String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      final ex = LogInWithEmailAndPasswordFailure.fromCode(e.code);
      return ex.message;
    } catch (_) {
      const ex = LogInWithEmailAndPasswordFailure();
      return ex.message;
    }
    return null;
  }

  Future<void> logout() async => await _auth.signOut();
}
