import 'package:get/get.dart';

class AppDimensions {
  static double screenWidth = Get.width;
  static double screenHeight = Get.height;

  // Padding
  static double paddingSmall = screenWidth * 0.04;
  static double paddingMedium = screenWidth * 0.06;
  static double paddingLarge = screenWidth * 0.08;

  // Heights
  static double fieldHeight = screenHeight * 0.065;
  static double buttonHeight = screenHeight * 0.07;

  // Font sizes
  static double fontSmall = screenWidth * 0.035;
  static double fontMedium = screenWidth * 0.045;
  static double fontLarge = screenWidth * 0.06;
}
