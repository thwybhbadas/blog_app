import 'package:get/get.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {

    //  English
    'en': {
      'login': 'Login',
      'email': 'Email',
      'password': 'Password',
      'profileView':'ProfileView'
    },

    //  Arabic
    'ar': {
      'login': 'تسجيل الدخول',
      'email': 'البريد الإلكتروني',
      'password': 'كلمة المرور',
       'profileView':'صفحة الملف الشخصي'
      
    },

  };
}