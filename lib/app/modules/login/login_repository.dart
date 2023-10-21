
import 'package:chamados/app/data/models/login_model.dart';
import 'package:chamados/app/data/models/rest_exception.dart';
import 'package:chamados/app/data/models/user_info_model.dart';
import 'package:chamados/app/data/providers/rest_client.dart';

import '../../../core/utils/helper.dart';
import '../../../core/values/api_path_constans.dart';
import '../../data/services/app_config/config.dart';

class LoginRepository {

  final RestClient restClient;

  LoginRepository(this.restClient);

  Future<UserInfoModel> login(LoginModel x) async {

    final response = await restClient.post(
      ConfigEnvironments.getEnvironments()['url']! + ApiPath.LOGIN_PATH,
      x.toJson(),
      headers: getAuthHeader(),
      decoder: (body) => UserInfoModel.fromMap(body),
    );
    if (response.hasError) {
      throw RestException(
        message: response.statusText ?? 'Erro',
        statusCode: response.statusCode ?? 0,
      );
    }
    return response.body!;
  }

}