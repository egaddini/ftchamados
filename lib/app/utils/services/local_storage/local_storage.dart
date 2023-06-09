import 'package:chamados/app/models/user_info_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageServices {
  
  static final LocalStorageServices _localStorageServices = LocalStorageServices._internal();

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

  Future<void> saveUser(UserInfoModel user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('user', user.toJson());
  }

  Future<UserInfoModel?> getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userJson =  prefs.getString('user');
    if (userJson != null) {
      return UserInfoModel.fromJson(userJson);
    }
    return null;
  }

}