import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class SRTextStyle {
  static const TextStyle title =
      TextStyle(fontSize: 23, fontWeight: FontWeight.bold);
  static const TextStyle subtitle =
      TextStyle(fontSize: 18, fontWeight: FontWeight.w300);
  static const TextStyle label =
      TextStyle(fontSize: 18, fontWeight: FontWeight.w500);
  static const TextStyle button =
      TextStyle(fontSize: 18, fontWeight: FontWeight.w500);
  static const TextStyle buttonV2 =
      TextStyle(fontSize: 18, fontWeight: FontWeight.w400);
  static const TextStyle ultraV1 =
      TextStyle(fontSize: 50, fontWeight: FontWeight.bold);
  static const TextStyle ultraV3 =
      TextStyle(fontSize: 80, fontWeight: FontWeight.bold);
  static const TextStyle sample =
      TextStyle(fontSize: 18, fontWeight: FontWeight.normal);
  static const TextStyle caption =
      TextStyle(fontSize: 18, fontWeight: FontWeight.normal);
}

//title
Widget getAppName({double? size}) => Text("SR",
    style: TextStyle(fontFamily: "Android Robot", fontSize: size ?? 30));
Widget getAppNameV2({double? size, bool? isbold}) => Text(
      "SafeRoom",
      style: TextStyle(
          fontSize: size ?? 20,
          fontWeight: isbold ?? true ? FontWeight.bold : null),
    );
String get getNotificationTitle => tr('title.notification');
String get getMessageTitle => tr('title.message');
//safeRoom
String get getSRVersion => tr('safeRoom.version');
//Labels
String get getLabelEmail => tr('label.email');
String get getLabelPassword => tr('label.password');
String get getLabelName => tr('label.name');
String get getLabelFamilyName => tr('label.familyName');
//buttons
String get getButtonSignIn => tr('button.signIn');
String get getButtonSignUp => tr('button.signUp');
String get getButtonSignInMsg => tr('button.signInMsg');
String get getButtonSignUpMsg => tr('button.signUpMsg');
String get getButtonBack => tr('button.back');

//errors
String get getError404 => tr('error.404');
String get getErrorPageNotFound => tr('error.pageNotFound');
//hints
String get getHintSearch => tr('hint.search');
//languages
String get getLanguageEn => tr('language.english');
String get getLanguageFa => tr('language.persion');
