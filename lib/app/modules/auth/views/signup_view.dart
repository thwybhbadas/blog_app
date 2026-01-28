import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:myblog/app/modules/auth/controllers/auth_controller.dart';

class SignupView extends GetView<AuthController> {
  SignupView({super.key});
  final fullNameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Sign Up")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: fullNameController,
              decoration: const InputDecoration(labelText: "Full Name"),
            ),
            TextField(
              controller: phoneController,
              decoration: const InputDecoration(labelText: "Phone"),
            ),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: "Email"),
            ),

            // GetBuilder<AuthController>(
            //   builder: (controller) {
            //     return TextField(
            //       obscureText: controller.isPasswordHidden,
            //       decoration: InputDecoration(
            //         suffixIcon: IconButton(
            //           icon: Icon(
            //             controller.isPasswordHidden
            //                 ? Icons.visibility_off
            //                 : Icons.visibility,
            //           ),
            //           onPressed: controller.togglePassword,
            //         ),
            //         labelText: "Password",
            //       ),
            //     );
            //   },
            // ),
            Obx(
              () => TextField(
                obscureText: controller.isPasswordHidden.value,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    icon: Icon(
                      controller.isPasswordHidden.value
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                    onPressed: controller.togglePassword,
                  ),
                  labelText: "Password",
                ),
              ),
            ),

            // TextField(
            //   controller: passwordController,
            //   obscureText: true,
            //   decoration: const InputDecoration(labelText: "Password"),
            // ),
            const SizedBox(height: 25),

            Obx(
              () => controller.isLoading.value
                  ? const CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: () {
                        controller.signUp(
                          fullNameController.text,
                          phoneController.text,
                          emailController.text,
                          passwordController.text,
                        );
                      },
                      child: const Text("Create Account"),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
