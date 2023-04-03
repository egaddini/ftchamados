import 'package:chamados/models/user_model.dart';

abstract class UserRepository {

  //Future<UserModel> getUser(String id);

  Future<String> saveUser(UserModel user);

  Future<UserModel> findByEmail(String email);

}