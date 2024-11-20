import 'package:procraft/src/app/shared/common/globals.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> loadUserKey() async {
  final preferences = await SharedPreferences.getInstance();

  final userKeyStoredLocally = preferences.containsKey('user_key');

  if (userKeyStoredLocally) {
    USER_KEY = preferences.getString('user_key')!;
  }
}
