import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:myblog/app/modules/auth/controllers/auth_controller.dart';
import 'package:myblog/app/routes/app_pages.dart';

class SigninView extends GetView<AuthController> {
  SigninView({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Sign In")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: "Email",
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: "Password",
              ),
            ),
            const SizedBox(height: 25),

            Obx(() => controller.isLoading.value
                ? const CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: () {
                      controller.signIn(
                        emailController.text.trim(),
                        passwordController.text.trim(),
                      );
                    },
                    child: const Text("Sign In"),
                  ),
            ),

            TextButton(
              onPressed: () {
                Get.toNamed(Routes.SIGNUP);
              },
              child: const Text("Create new account"),
            )
          ],
        ),
      ),
    );
  }
}
