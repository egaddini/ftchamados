
import 'package:chamados/models/user_info_model.dart';
import 'package:chamados/models/user_model.dart';

abstract class LocalRepository {

  String saveToken(String? login);

  String? getToken();
  
  void saveUser(UserInfoModel user);

  UserInfoModel? getUser(); 
}