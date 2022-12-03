import 'package:firebase_core/firebase_core.dart';
import 'package:saferoom/firebase_options.dart';
import 'package:saferoom/src/safe_room.dart';

void main() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  SafeRoom.init();
}
