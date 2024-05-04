import 'package:shared_preferences/shared_preferences.dart';

class PrefServices {
  static SharedPreferences? pref;

  static Future configurePref() async => pref = await SharedPreferences.getInstance();

  static Future setString(PrefString key, String value) async => await pref!.setString(key.value, value);
  static  getString(PrefString key)  => pref!.getString(key.value);

  static Future setBool(PrefBool key, bool value) async => await pref!.setBool(key.value, value);
  static  getBool(PrefBool key)  => pref!.getBool(key.value);
}

enum PrefString {
  token('token'),
  infoJson('infoJson');


  final String value;
  const PrefString(this.value);
}

enum PrefBool {
  isLogin('isLogin');

  final String value;
  const PrefBool(this.value);
}
