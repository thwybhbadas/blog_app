import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:myblog/app/data/services/local_service.dart';
import 'package:myblog/app/data/services/theme_service.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
   ProfileView({super.key});

  final localeService = LocaleService();

void changeLanguage(String langCode) {
  Locale locale = Locale(langCode);

  Get.updateLocale(locale);

  localeService.saveLocale(langCode);
}
final themeService = ThemeService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text('setting'.tr),
        centerTitle: true,
      ),
      body: Column(
        children: [
          ElevatedButton(
  onPressed: () {
    changeLanguage('ar');
  },
  child: Text("Arabic"),
),

ElevatedButton(
  onPressed: () {
   changeLanguage('en');
  },
  child: Text("English"),
),
IconButton(
  onPressed: () {
    themeService.switchTheme();
  },
  icon: Icon(Icons.dark_mode),
),
        ],
      )
    );
  }
}
