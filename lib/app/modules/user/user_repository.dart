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

    Future<List<dynamic>> getSectors() async {
    final response = await restClient.get(ApiPath.SECTOR_PATH);
    return response.status.hasError ? Future.error(response.statusText!) : response.body;
  }

  Future<dynamic> putUser(int id, dynamic body) async {
    final response = await restClient.put('${ApiPath.USER_PATH}/$id', body);
    return response.status.hasError ? Future.error(response.statusText!) : response.body;
  }

}
