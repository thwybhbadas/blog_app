import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:myblog/app/core/utils/app_dimensions.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // -------- LOGO --------
            Image.asset(
              'assets/images/splash.png',
              width: AppDimensions.screenWidth*0.70,
              height:  AppDimensions.screenHeight*0.70,
            ),

             SizedBox(height: AppDimensions.paddingSmall),

            // -------- LOTTIE ANIMATION --------
            Lottie.asset(
              'assets/lottie/loading.json',
              width: AppDimensions.screenWidth*0.20,
              height:  AppDimensions.screenHeight*0.20,
            ),

          ],
        ),
      ),
    );
  }
}