import 'dart:convert';
import 'dart:developer';
import 'package:chamados/app/models/error_dto.dart';
import 'package:chamados/app/models/rest_exception.dart';
import 'package:chamados/app/models/token_model.dart';
import 'package:chamados/app/models/user_info_model.dart';
import 'package:chamados/app/models/user_model.dart';
import 'package:chamados/app/utils/helpers/helper.dart';
import 'package:chamados/app/utils/repositories/user_repository.dart';
import 'package:chamados/app/utils/services/local_storage/local_storage.dart';
import 'package:dio/dio.dart';

class UserRepositoryImpl implements UserRepository { 

  var data = [];
  String? token;
  List<UserInfoModel> results = [];
  static const String BASE_PATH = "http://localhost:9090/api/v1/user";
  static const String ATIVA_PATH = "/ativa";
  LocalStorageServices localStorage = LocalStorageServices();  

  @override
  Future<UserModel> findByEmail(String email) async {
    
    UserModel user;
    try {
      final uri = Uri.http('localhost:9092', '/api/v1/user/email', {'email': email});
      final result = await Dio().get(
        uri.toString(),
        options: Options(headers: await getAuthHeader(true)),
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
        options: Options(headers: await getAuthHeader(true)),
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

  @override
  Future<String> ativaUsuario(String email) async {
    String message;
    final result = await Dio().get(
      '$BASE_PATH$ATIVA_PATH/$email',
      options: Options(headers: await getAuthHeader(true)),
    );
    if (result.statusCode == 200) {
      message = result.statusMessage!;
    } else {
      final ErrorDTO errorDTO = ErrorDTO.fromMap(result.data);
      throw RestException(message: errorDTO.message, statusCode: errorDTO.status);
    }
    return message;
  }

}