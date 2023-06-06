import 'package:chamados/app/models/login_model.dart';
import 'package:chamados/app/models/user_model.dart';

abstract class AuthRepository {

  Future<void> authenticate(LoginModel login);
  
  Future<String> register(UserModel user);

  void logout();
  
}