import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myblog/app/core/utils/app_colors.dart';
import 'package:myblog/app/core/utils/app_dimensions.dart';

class AppTextStyles {
  // Titles
  static TextStyle titleLarge = GoogleFonts.zain(
    fontSize: AppDimensions.fontLarge,
    fontWeight: FontWeight.bold,
  );

  static TextStyle titleMedium = GoogleFonts.zain(
    fontSize: AppDimensions.fontMedium,
    fontWeight: FontWeight.w600,
  );

  // Body Text
  static TextStyle body = GoogleFonts.zain(
    fontSize: AppDimensions.fontSmall,
    fontWeight: FontWeight.normal,
    color: Colors.black
  );

  // Buttons
  static TextStyle button = GoogleFonts.zain(
    fontSize: AppDimensions.fontMedium,
    fontWeight: FontWeight.normal,
    color: AppColors.background,
  );
  static TextStyle links = GoogleFonts.zain(
    fontSize: AppDimensions.fontSmall,
    fontWeight: FontWeight.w600,
    color: AppColors.primary,
  );

  // Caption
  static TextStyle caption = GoogleFonts.zain(
    fontSize: AppDimensions.fontSmall * 0.9,
    color: Colors.grey,
  );
}
