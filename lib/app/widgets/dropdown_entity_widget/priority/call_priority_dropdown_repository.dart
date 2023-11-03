import 'package:chamados/app/data/models/priority.dart';
import 'package:chamados/app/data/models/rest_exception.dart';
import 'package:chamados/app/data/providers/rest_client.dart';
import 'package:chamados/app/data/services/app_config/config.dart';
import 'package:chamados/core/values/api_path_constans.dart';

class CallPriorityDropdownRepository {

  final RestClient restClient;

  CallPriorityDropdownRepository(this.restClient);

  Future<List<PriorityModel>> findAll() async {

    final response = await restClient.get<List<PriorityModel>>(
      ConfigEnvironments.getEnvironments()['url']! + ApiPath.PRIORITY_PATH,
      decoder: (response) => PriorityModel.fromDynamic(response as List<dynamic>)
    );

    if (response.hasError) {
      throw RestException(
        message: response.statusText ?? 'Erro',
        statusCode: response.statusCode ?? 0,
      );
    }
    
    return response.body as List<PriorityModel>;
  }

}