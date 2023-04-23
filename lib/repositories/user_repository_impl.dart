import 'dart:convert';
import 'dart:developer';
import 'package:chamados/models/token_model.dart';
import 'package:chamados/models/user_info_model.dart';
import 'package:chamados/models/user_model.dart';
import 'package:chamados/repositories/local_repository.dart';
import 'package:chamados/repositories/local_repository_impl.dart';
import 'package:dio/dio.dart';
import './user_repository.dart';
import 'package:http/http.dart' as http;

class UserRepositoryImpl implements UserRepository {

  var data = [];
  String? token;
  List<UserInfoModel> results = [];
  static const String BASE_PATH = "http://localhost:9090/api/v1/user";
  LocalRepository localRepo = LocalRepositoryImpl();
  

  @override
  Future<UserModel> findByEmail(String email) async {
    
    UserModel user;
    try {
      final uri = Uri.http('localhost:9092', '/api/v1/user/email', {'email': email});
      final result = await Dio().get(
        uri.toString(),
        options: Options(headers: getAuthHeader(true)),
      );
      if (result.statusCode == 200) {
        user = UserModel.fromMap(result.data);
      } else {
        log("Erro ao autenticar usuário: código de status ${result.statusCode}");
        throw Exception("Erro ao autenticar usuário: código de status ${result.statusCode}");
      }
    } catch (e) {
      log("Erro na requisição", error: e);
      throw Exception("Erro na requisição");
    }
    if (user == null) {
      throw Exception("Usuário não encontrado");
    }
    return user;
  }
  
  @override
  Future<String> saveUser(UserModel user) async {

    String tokenReponse = "";

    try {
      final headers = {
        'Content-Type': 'application/json'
      };
      final result = await Dio().post(
      'http://localhost:9092/api/v1/auth/register',
      data: jsonEncode(user.toMap()),
        options: Options(headers: headers)
      );
    if (result.statusCode == 200) {
      final TokenModel token = TokenModel.fromMap(result.data);
      tokenReponse = token.token;
    } else {
      log("Erro ao autenticar usuário: código de status ${result.statusCode}");
      throw Exception("Erro ao autenticar usuário: código de status ${result.statusCode}");
    }
    } catch (e) {
      log("Erro na requisição", error: e);
      //throw Exception("Erro na requisição");
    }
    return tokenReponse;  
  }

  @override
  Future<List<UserInfoModel>> getuserList({String? query}) async {
    try {
      final response = await Dio().get(
        BASE_PATH, 
        options: Options(headers: getAuthHeader(true)),
      );
      if (response.statusCode == 200) {
        final data = jsonDecode(response.data);
        var results = data.map((e) => UserInfoModel.fromJson(e)).toList();
        if (query != null) {
          results = results.where((element) => element.firstname!.toLowerCase().contains((query.toLowerCase()))).toList();
        }
        return results;
      } else {
        print("fetch error");
      }
    } catch (e) {
      print('error: $e');
    }
    return [];
  }

  Map<String, String> getAuthHeader(bool auth) {
    if (auth) {
      token ??= localRepo.getToken();
      return {
        'content-type': 'application/json;',
        'authorization': 'Bearer $token'
      };      
    } else {
      return {
        'content-type': 'application/json;',
      };
    }
  }

}
