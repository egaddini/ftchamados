import 'package:chamados/app/data/models/rest_exception.dart';
import 'package:chamados/app/data/models/user_dto.dart';
import 'package:chamados/app/data/providers/rest_client.dart';
import 'package:chamados/core/values/api_path_constans.dart';

class ContactsRepository {

  final RestClient restClient;

  ContactsRepository(this.restClient);

  Future<List<UserDTO>> getBeerList(int pageKey, int pageSize) async {
    
    final response = await restClient.get<List<UserDTO>>(
      ApiPath.USER_TINY_PATH,
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



  
  Future<List<UserDTO>> findAll() async {

    final response = await restClient.get<List<UserDTO>>(
      ApiPath.USER_TINY_PATH,
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