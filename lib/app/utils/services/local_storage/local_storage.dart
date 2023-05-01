import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageServices {
  
  static final LocalStorageServices _localStorageServices =
      LocalStorageServices._internal();

  factory LocalStorageServices() {
    return _localStorageServices;
  }

  LocalStorageServices._internal();

  Future<void> saveToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token', token);
  }

  Future<String?> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }
}