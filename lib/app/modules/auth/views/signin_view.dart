import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:myblog/app/core/utils/app_colors.dart';
import 'package:myblog/app/core/utils/app_dimensions.dart';
import 'package:myblog/app/core/utils/app_text_style.dart';
import 'package:myblog/app/modules/auth/controllers/auth_controller.dart';
import 'package:myblog/app/routes/app_pages.dart';

class SigninView extends GetView<AuthController> {
  SigninView({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //
      backgroundColor: AppColors.background,

      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(AppDimensions.paddingMedium),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: AppDimensions.screenHeight * 0.12),
              Text("Welcome Back", style: AppTextStyles.titleLarge),
              //
              SizedBox(height: AppDimensions.paddingSmall),
              //
              Text("Sign in to continue", style: AppTextStyles.titleMedium),
              SizedBox(height: AppDimensions.screenHeight * 0.06),
              // Email
              SizedBox(
                height: AppDimensions.fieldHeight,
                child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  controller: emailController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: AppColors.scandry,
                    border: InputBorder.none, // إخفاء الحدود
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors.scandry,
                        width: 1.5,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors.primary,
                        width: 1.5,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: "Enter your Email",
                    hintStyle: AppTextStyles.body,
                  ),
                ),
              ),

              SizedBox(height: AppDimensions.paddingSmall),

              Obx(
                () => SizedBox(
                  height: AppDimensions.fieldHeight,
                  child: TextField(
                    keyboardType: TextInputType.visiblePassword,
                    controller: passwordController,
                    obscureText: controller.isPasswordHidden.value,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: AppColors.scandry,
                      border: InputBorder.none, // إخفاء الحدود
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: AppColors.scandry,
                          width: 1.5,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: AppColors.primary,
                          width: 1.5,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintText: "Enter your Password",
                      hintStyle: AppTextStyles.body,
                      suffixIcon: IconButton(
                        icon: Icon(
                          controller.isPasswordHidden.value
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                        onPressed: controller.togglePassword,
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(height: AppDimensions.screenHeight * 0.06),

              // Button
              Obx(
                () => controller.isLoading.value
                    ? Center(child: CircularProgressIndicator())
                    : InkWell(
                        borderRadius: BorderRadius.circular(30),
                        onTap: () => controller.signIn(
                          emailController.text.trim(),
                          passwordController.text.trim(),
                        ),
                        child: Container(
                          height: AppDimensions.buttonHeight,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: AppColors.primary,
                          ),
                          child: Center(
                            child: Text("Sign In", style: AppTextStyles.button),
                          ),
                        ),
                      ),
              ),

              SizedBox(height: AppDimensions.paddingMedium),
              // -------- SIGN UP LINK --------
              Center(
                child: TextButton(
                  onPressed: () {
                    Get.toNamed(Routes.SIGNUP);
                  },
                  child:RichText(text: TextSpan(
                    children: [
                      TextSpan(
                        text:  "Don’t have an account?",
                        style: AppTextStyles.body,
                      ),
                      TextSpan(
                        text:  " ",
                      ),
                      TextSpan(
                        text:  "Sign Up",
                        style: AppTextStyles.links,
                      ),
                    ]
                  ))
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
