import 'package:chamados/app/data/models/rest_exception.dart';
import 'package:chamados/app/data/models/user_dto.dart';
import 'package:chamados/app/data/providers/rest_client.dart';
import 'package:chamados/app/data/services/app_config/config.dart';
import 'package:chamados/core/values/api_path_constans.dart';

class UserDropdownRepository {

  final RestClient restClient;

  UserDropdownRepository(this.restClient);

  Future<List<UserDTO>> findAll() async {

    final response = await restClient.get<List<UserDTO>>(
      ConfigEnvironments.getEnvironments()['url']! + ApiPath.USER_TINY_PATH,
      decoder: (response) => UserDTO.fromDynamic(response as List<dynamic>)
    );

    if (response.hasError) {
      throw RestException(
        message: response.statusText ?? 'Erro',
        statusCode: response.statusCode ?? 0,
      );
    }
    
    return response.body as List<UserDTO>;
  }

}