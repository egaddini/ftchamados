import 'package:chamados/models/login_model.dart';

abstract class AuthRepository {

  Future<String?> authenticate(LoginModel login);
  
  void logout();
  
}