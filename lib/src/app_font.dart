import 'package:flutter/material.dart';

class AppText {
  static String font(Locale locale) {
    String font;
    switch (locale.languageCode) {
      case 'en':
        font = 'Roboto';
        break;
      case 'fa':
        font = 'Iran Sans';
        break;
      default:
        font = 'Cabin';
    }
    return font;
  }
}
