import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:myblog/app/data/models/user_model.dart';
import 'package:myblog/app/data/services/firebase_services.dart';
import 'package:myblog/app/routes/app_pages.dart';

class AuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseService _firebaseService = FirebaseService();

  final isLoading = false.obs;
 
  // ---------------- SIGN IN ----------------
  Future<void> signIn(String email, String password) async {
    try {
      isLoading.value = true;

      final credential =
          await _auth.signInWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );

      if (!credential.user!.emailVerified) {
        Get.snackbar(
          'Email not verified',
          'Please verify your email first',
        );
        return;
      }

      Get.offAllNamed(Routes.HOME);

    } on FirebaseAuthException catch (e) {
      Get.snackbar(
        'Login Error',
        e.message ?? e.code,
      );
    } finally {
      isLoading.value = false;
    }
  }

  //   // -------- SIGN UP --------
  //   Future<void> signUp(String fullName,
  //   String phone,
  //   String email,
  //   String password,
  //   ) async {
  //     try {
  //       isLoading.value = true;

  //       // await _auth.createUserWithEmailAndPassword(
  //       //   email: email,
  //       //   password: password,
  //       // );
  //  final credential =
  //         await _auth.createUserWithEmailAndPassword(
  //       email: email,
  //       password: password,
  //     );

  //     await credential.user!.sendEmailVerification();

  //     final user = UserModel(
  //       uid: credential.user!.uid,
  //       fullName: fullName,
  //       phone: phone,
  //       email: email,
  //       isEmailVerified: false,
  //     );

  //       await _firebaseService.saveUserData(user);

  //       Get.snackbar(
  //       "Verify Email",
  //       "Please check your email to verify your account",
  //     );

  //       Get.offAllNamed(Routes.SIGNIN);
  //   } catch (e) {
  //     Get.snackbar("Error", e.toString());
  //   } finally {
  //     isLoading.value = false;
  //   }
  // }
  //
  // ---------------- SIGN UP ----------------
  Future<void> signUp(
    String fullName,
    String phone,
    String email,
    String password,
  ) async {
    // ✅ تحقق محلي قبل Firebase
    if (!GetUtils.isEmail(email.trim())) {
      Get.snackbar('Invalid Email', 'Please enter a valid email address');
      return;
    }

    try {
      isLoading.value = true;

      final credential = await _auth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );

      await credential.user!.sendEmailVerification();

      final user = UserModel(
        uid: credential.user!.uid,
        fullName: fullName.trim(),
        phone: phone.trim(),
        email: email.trim(),
        isEmailVerified: false,
      );

      await _firebaseService.saveUserData(user);

      Get.snackbar('Verify Email', 'Check your inbox to verify your email');

      Get.offAllNamed(Routes.SIGNIN);
    } on FirebaseAuthException catch (e) {
      Get.snackbar('Auth Error', e.message ?? e.code);
    } finally {
      isLoading.value = false;
    }
  }

  // ---------------- LOGOUT ----------------
Future<void> logout() async {
  try {
    await _auth.signOut();

    Get.offAllNamed(Routes.SIGNIN);
  } catch (e) {
    Get.snackbar(
      'Logout Error',
      e.toString(),
    );
  }
}
}
