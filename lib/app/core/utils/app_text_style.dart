import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myblog/app/core/utils/app_dimensions.dart';

class AppTextStyles {
  // Titles
  static TextStyle titleLarge = GoogleFonts.poppins(
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
  );

  // Buttons
  static TextStyle button = GoogleFonts.zain(
    fontSize: AppDimensions.fontMedium,
    fontWeight: FontWeight.w600,
  );

  // Caption
  static TextStyle caption = GoogleFonts.zain(
    fontSize: AppDimensions.fontSmall * 0.9,
    color: Colors.grey,
  );
}
