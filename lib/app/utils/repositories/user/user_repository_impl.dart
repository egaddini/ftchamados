import 'dart:convert';
import 'dart:developer';
import 'package:chamados/app/models/error_dto.dart';
import 'package:chamados/app/models/rest_exception.dart';
import 'package:chamados/app/models/token_model.dart';
import 'package:chamados/app/models/user_info_model.dart';
import 'package:chamados/app/models/user_model.dart';
import 'package:chamados/app/utils/helpers/helper.dart';
import 'package:chamados/app/utils/repositories/user/user_repository.dart';
import 'package:chamados/app/utils/services/local_storage/local_storage.dart';
import 'package:dio/dio.dart';

class UserRepositoryImpl implements UserRepository { 

  var data = [];
  String? token;
  List<UserInfoModel> results = [];
  static const String _basePath = "http://localhost:9090/api/v1/user";
  static const String _ativaPath = "/ativa";
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
    // ignore: unnecessary_null_comparison
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
    List<UserInfoModel> results = [];

    final response = await Dio().get(
      _basePath, 
      options: Options(headers: await getAuthHeader(false)),
    );
    if (response.statusCode == 200) {
      List<dynamic> jsonList = response.data as List<dynamic>;
      results = jsonList.map((json) => UserInfoModel.fromMap(json)).toList();
      if (query != null) {
        results = results.where((element) => element.email!.toLowerCase().contains((query.toLowerCase()))).toList();
      }
    } else {
      final ErrorDTO errorDTO = ErrorDTO.fromMap(response.data);
      throw RestException(message: errorDTO.message, statusCode: errorDTO.status);
    }
    return results;
  }

  @override
  Future<String> ativaUsuario(String email) async {
    String message;
    final result = await Dio().get(
      '$_basePath$_ativaPath/$email',
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

  @override
  Future<String> delete(int id) async {
    String message;
    final result = await Dio().delete(
      '$_basePath/$id',
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