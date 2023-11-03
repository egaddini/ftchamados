
import 'package:chamados/app/data/models/call_category_model.dart';
import 'package:chamados/app/data/providers/rest_client.dart';

import '../../../core/values/api_path_constans.dart';
import '../../data/models/rest_exception.dart';
import '../../data/services/app_config/config.dart';

class HomeRepository {

  final RestClient restClient;

  HomeRepository(this.restClient);

  Future<List<CallCategoryModel>> findAll(List sector, List priority) async {

    final response = await restClient.get<List<CallCategoryModel>>(
      ConfigEnvironments.getEnvironments()['url']! + ApiPath.CALL_CATEGORY_PATH,
      query: {'sector' : sector.map((e) => e.toString()), 'priority' : priority.map((e) => e.toString())},
      decoder: (response) => CallCategoryModel.fromDynamic(response as List<dynamic>)
    );

    if (response.hasError) {
      throw RestException(
        message: response.statusText ?? 'Erro',
        statusCode: response.statusCode ?? 0,
      );
    }
    
    return response.body as List<CallCategoryModel>;
  }

}