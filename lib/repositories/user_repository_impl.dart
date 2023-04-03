import 'dart:convert';
import 'dart:developer';
import 'package:chamados/models/token_model.dart';
import 'package:chamados/models/user_model.dart';
import 'package:dio/dio.dart';
import './user_repository.dart';

class UserRepositoryImpl implements UserRepository {

    var data = [];
    List<UserModel> results = [];
    String urlList = 'https://jsonplaceholder.typicode.com/users/';

  @override
  Future<UserModel> findByEmail(String email) async {
    UserModel user;
    try {
      final headers = {
        'Content-Type': 'application/json',
      };
      final uri = Uri.http('localhost:9092', '/api/v1/user/email', {'email': email});
      final result = await Dio().get(
        uri.toString(),
        options: Options(headers: headers),
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
        //'Authorization': 'Bearer <seu token>'
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
  /*Future<List<UserModel>> getuserList({String? query}) async {
    var url = Uri.parse(urlList);
    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
      
        data = json.decode(response.body);
        results = data.map((e) => UserModel.fromJson(e)).toList();
        if (query!= null){
          results = results.where((element) => element.name!.toLowerCase().contains((query.toLowerCase()))).toList();
        }
      } else {
        print("fetch error");
      }
    } on Exception catch (e) {
      print('error: $e');
    }
    return results;
  }*/


}
