import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:myblog/app/routes/app_pages.dart';

class SplashController extends GetxController {

  @override
  void onInit() {
    super.onInit();
    checkLoginStatus();
  }

  Future<void> checkLoginStatus() async {
    await Future.delayed(const Duration(seconds: 2));

    final user = FirebaseAuth.instance.currentUser;

if (user != null && user.emailVerified) {
  Get.offAllNamed(Routes.HOME);
} else {
  Get.offAllNamed(Routes.SIGNIN);
}
  }
}
