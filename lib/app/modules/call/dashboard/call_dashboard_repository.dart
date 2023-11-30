import 'package:chamados/app/data/models/call.dart';
import 'package:chamados/app/data/providers/rest_client.dart';

import '../../../../core/values/api_path_constans.dart';
import '../../../data/models/rest_exception.dart';

class CallDashboardRepository {

  final RestClient restClient;

  CallDashboardRepository(this.restClient);

  Future<List<Call>> findAll(String requester, String solver, List<int> sectors, List<int> priorities, List<int> categories, List<int> status) async {

    final response = await restClient.get<List<Call>>(
      ApiPath.CALL_PATH,
      query: {'requester' : requester, 'solver': solver, 'sectors':sectors.map((e) => e.toString()), 'priorities':priorities.map((e) => e.toString()), 'categories':categories.map((e) => e.toString()), 'satatus':status.map((e) => e.toString())},
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