import 'package:chamados/app/data/models/call.dart';
import 'package:chamados/app/data/providers/rest_client.dart';

import '../../../../core/values/api_path_constans.dart';
import '../../../data/models/rest_exception.dart';
import '../../../data/services/app_config/config.dart';

class CallRequesterDashboardRepository {

  final RestClient restClient;

  CallRequesterDashboardRepository(this.restClient);

  Future<List<Call>> findAll(String email) async {

    final response = await restClient.get<List<Call>>(
      ConfigEnvironments.getEnvironments()['url']! + ApiPath.CALL_PATH,
      query: {'requesterEmail' : email},
      decoder: (response) => Call.fromDynamic(response as List<dynamic>)
    );

    if (response.hasError) {
      throw RestException(
        message: response.statusText ?? 'Erro',
        statusCode: response.statusCode ?? 0,
      );
    }
    
    return response.body as List<Call>;
  }


}