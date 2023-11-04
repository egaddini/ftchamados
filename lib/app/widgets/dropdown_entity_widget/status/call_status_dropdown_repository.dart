import 'package:chamados/app/data/models/call_status_model.dart';
import 'package:chamados/app/data/models/rest_exception.dart';
import 'package:chamados/app/data/providers/rest_client.dart';
import 'package:chamados/app/data/services/app_config/config.dart';
import 'package:chamados/core/values/api_path_constans.dart';

class CallStatusDropdownRepository {

  final RestClient restClient;

  CallStatusDropdownRepository(this.restClient);

  Future<List<CallStatusModel>> findAll() async {

    final response = await restClient.get<List<CallStatusModel>>(
      ConfigEnvironments.getEnvironments()['url']! + ApiPath.STATUS_PATH,
      decoder: (response) => CallStatusModel.fromDynamic(response as List<dynamic>)
    );

    if (response.hasError) {
      throw RestException(
        message: response.statusText ?? 'Erro',
        statusCode: response.statusCode ?? 0,
      );
    }
    
    return response.body as List<CallStatusModel>;
  }

}