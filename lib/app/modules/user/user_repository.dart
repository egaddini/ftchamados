import 'package:chamados/app/data/models/rest_exception_model.dart';
import 'package:chamados/app/data/models/sector_model.dart';
import 'package:chamados/app/data/providers/rest_client.dart';
import 'package:chamados/app/data/services/app_config/config.dart';
import 'package:chamados/core/values/api_path_constans.dart';

class UserRepository {

  final RestClient restClient;

  UserRepository(this.restClient);

  Future<List<dynamic>> getUsers() async {
    final response = await restClient.get(ConfigEnvironments.getEnvironments()['url']! + ApiPath.USER_PATH);
    return response.status.hasError? Future.error(response.statusText!) : response.body;
  }

  Future<dynamic> removeUser(int id) async {
    final response = await restClient.delete('${ConfigEnvironments.getEnvironments()['url']! + ApiPath.USER_PATH}/$id');
    return response.status.hasError ? Future.error(response.statusText!) : response.body;
  }


  Future<dynamic> putUser(int id, dynamic body) async {
    final response = await restClient.put('${ConfigEnvironments.getEnvironments()['url']! +ApiPath.USER_PATH}/$id', body);
    return response.status.hasError ? Future.error(response.statusText!) : response.body;
  }

  Future<List<SectorModel>> findSectors() async {

    final response = await restClient.get<List<SectorModel>>(
      ConfigEnvironments.getEnvironments()['url']! + ApiPath.SECTOR_PATH,
      decoder: (response) => SectorModel.fromDynamic(response as List<dynamic>)
    );

    if (response.hasError) {
      throw RestException(
        message: response.statusText ?? 'Erro',
        statusCode: response.statusCode ?? 0,
      );
    }
    
    return response.body as List<SectorModel>;
  }

}


