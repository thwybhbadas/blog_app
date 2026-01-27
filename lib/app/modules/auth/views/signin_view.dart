import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:myblog/app/core/utils/app_dimensions.dart';
import 'package:myblog/app/core/utils/app_text_style.dart';
import 'package:myblog/app/modules/auth/controllers/auth_controller.dart';

class SigninView extends GetView<AuthController> {
  SigninView({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(AppDimensions.paddingMedium),
          // padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              //
              SizedBox(height: AppDimensions.screenHeight * 0.15),
              //
              Text(
                "Welcome Back",
                // style: TextStyle(
                //   fontSize: AppDimensions.fontLarge,
                //   fontWeight: FontWeight.bold,
                // ),

                 style: AppTextStyles.titleLarge,
              ),
              //
              SizedBox(height: AppDimensions.screenHeight * 0.05),
        
              // Email
              SizedBox(
                height: AppDimensions.fieldHeight,
                child: TextField(
                  controller: emailController,
                  decoration: const InputDecoration(hintText: "Email"),
                ),
              ),
        
              // const SizedBox(height: 15),
              SizedBox(height: AppDimensions.paddingSmall),
        
              SizedBox(
                height: AppDimensions.fieldHeight,
                child: TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(hintText: "Password"),
                ),
              ),
              SizedBox(height: AppDimensions.screenHeight * 0.05),
        
              // const SizedBox(height: 25),
        
             // Button
                SizedBox(
                  //
                  height: AppDimensions.buttonHeight,
                  width: double.infinity,
                  child: Obx(
                    () => controller.isLoading.value
                        ? const Center(child: CircularProgressIndicator())
                        : ElevatedButton(
                            onPressed: () {
                              controller.signIn(
                                emailController.text.trim(),
                                passwordController.text.trim(),
                              );
                            },
                            child: Text(
                              "Sign In",
                                style: AppTextStyles.button,
                              // style: TextStyle(
                              //   //
                              //   fontSize: AppDimensions.fontMedium,
                              // ),
                            ),
                          ),
                  ),
                ),
              ],
            ),
          ),
      ),
    );
  }
}
