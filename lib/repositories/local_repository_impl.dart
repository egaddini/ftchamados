import 'dart:html' as html;
import 'dart:convert';

import 'package:chamados/models/user_info_model.dart';
import 'package:chamados/models/user_model.dart';

import 'local_repository.dart';

class LocalRepositoryImpl implements LocalRepository {
  
  @override
  String saveToken(String? token) {
    html.window.localStorage['jwt'] = '$token';
    return '$token';
  }

  @override
  String? getToken() {
    return html.window.localStorage['jwt'];
  }

  @override
  void saveUser(UserInfoModel user) {
    final json = jsonEncode(user.toJson());
    html.window.localStorage['user'] = json;
  }

  @override
  UserInfoModel? getUser() {
    final json = html.window.localStorage['user'];
    if (json != null) {
      final map = jsonDecode(json);
      return UserInfoModel.fromJson(map);
    }
    return null;
  }

}