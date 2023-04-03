
import 'package:chamados/models/user_model.dart';

abstract class LocalRepository {

  String saveToken(String login);

  String? getToken();
  
  void saveUser(UserModel user);

  UserModel? getUser(); 
}