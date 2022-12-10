import 'package:shared_preferences/shared_preferences.dart';

class LocalDb {
  LocalDb._();

  static void setIsInfoSeen(bool? isSeen) async {
    var preferences = await SharedPreferences.getInstance();
    preferences.setBool("isBasicInfoSeen", isSeen ?? false);
  }

  static getIsInfoSeen() async {
    var preferences = await SharedPreferences.getInstance();
    bool isSeen = preferences.getBool("isBasicInfoSeen") ?? false;
    return isSeen;
  }
}
