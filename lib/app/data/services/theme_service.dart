import 'package:get_storage/get_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeService {
  final _box = GetStorage();
  final _key = 'isDarkMode';

  /// get current theme
  ThemeMode getThemeMode() {
    bool isDark = _box.read(_key) ?? false;
    return isDark ? ThemeMode.dark : ThemeMode.light;
  }

  /// save theme
  void saveTheme(bool isDark) {
    _box.write(_key, isDark);
  }

  /// change theme
  void switchTheme() {
    bool isDark = _box.read(_key) ?? false;

    if (isDark) {
      Get.changeThemeMode(ThemeMode.light);
      saveTheme(false);
    } else {
      Get.changeThemeMode(ThemeMode.dark);
      saveTheme(true);
    }
  }
}