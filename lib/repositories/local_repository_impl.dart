import 'dart:html' as html;
import 'dart:convert';

import 'package:chamados/models/user_model.dart';

import 'local_repository.dart';

class LocalRepositoryImpl implements LocalRepository {
  
  @override
  String saveToken(String token) {
    html.window.localStorage['jwt'] = '$token';
    return '$token';
  }

  @override
  String? getToken() {
    return html.window.localStorage['jwt'];
  }

  @override
  void saveUser(UserModel user) {
    final json = jsonEncode(user.toMap());
    html.window.localStorage['user'] = json;
  }

  @override
  UserModel? getUser() {
    final json = html.window.localStorage['user'];
    if (json != null) {
      final map = jsonDecode(json);
      return UserModel.fromJson(map);
    }
    return null;
  }

}