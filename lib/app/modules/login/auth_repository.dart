import '../../data/models/login_model.dart';
import '../../data/models/user_model.dart';

abstract class AuthRepository {
  Future<void> authenticate(LoginModel login);

  Future<String> register(UserModel user);

  void logout();
}
