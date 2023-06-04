import 'package:chamados/app/models/user_info_model.dart';
import 'package:chamados/app/models/user_model.dart';

abstract class UserRepository {

  //Future<UserModel> getUser(String id);

  Future<String> saveUser(UserModel user);

  Future<UserModel> findByEmail(String email);

  Future<String> delete(int id);

  Future<List<UserInfoModel>> getuserList({String? query}); 

  Future<String> ativaUsuario(String email);

}