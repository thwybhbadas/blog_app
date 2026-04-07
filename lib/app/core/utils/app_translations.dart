import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';

class AppTranslations extends Translations {
  // @override
  // Map<String, Map<String, String>> get keys => {

  //   //  English
  //   'en': {
  //     'login': 'Login',
  //     'email': 'Email',
  //     'password': 'Password',
  //     'profileView':'ProfileView'
  //   },

  //   //  Arabic
  //   'ar': {
  //     'login': 'تسجيل الدخول',
  //     'email': 'البريد الإلكتروني',
  //     'password': 'كلمة المرور',
  //      'profileView':'صفحة الملف الشخصي'
      
  //   },

  // };

   static Map<String, Map<String, String>> translations = {};

  static Future<void> loadTranslations() async {
    final enJson = await rootBundle.loadString('assets/lang/en.json');
    final arJson = await rootBundle.loadString('assets/lang/ar.json');

    translations['en'] = Map<String, String>.from(json.decode(enJson));
    translations['ar'] = Map<String, String>.from(json.decode(arJson));
  }

  @override
  Map<String, Map<String, String>> get keys => translations;
}