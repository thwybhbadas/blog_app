import 'package:get_storage/get_storage.dart';
import 'package:flutter/material.dart';

class LocaleService {
  final _box = GetStorage();

  final _key = 'lang';

  Locale getLocale() {
    String? langCode = _box.read(_key);

    if (langCode == null) {
      return const Locale('en');
    }

    return Locale(langCode);
  }

  void saveLocale(String langCode) {
    _box.write(_key, langCode);
  }
}