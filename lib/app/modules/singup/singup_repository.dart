import 'package:chamados/app/data/models/user_model.dart';
import 'package:chamados/app/data/providers/rest_client.dart';

import '../../../core/values/api_path_constans.dart';
import '../../data/models/rest_exception.dart';

class SingUpRepository {

  final RestClient restClient;

  SingUpRepository(this.restClient);

  Future<String> singup(UserModel user) async {

    final response = await restClient.post(
      ApiPath.SINGUP_PATH,
      user.toJson(),
    );

    if (response.hasError) {
      throw RestException(
        message: response.statusText ?? 'Erro',
        statusCode: response.statusCode ?? 0,
      );
    }
    
    return response.body['message'] as String;
  }

}
