import 'package:flutter/material.dart';
import 'package:saferoom/src/constans.dart';

String _language(Locale locale) {
  String? language;
  switch (locale.languageCode) {
    case 'en':
      language = getLanguageEn;
      break;
    case 'fa':
      language = getLanguageFa;
      break;
    case 'ar':
      language = getLanguageFa;
      break;
  }
  return language!;
}
