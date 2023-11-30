import 'package:chamados/app/data/models/call_category_model.dart';
import 'package:chamados/app/data/models/rest_exception.dart';
import 'package:chamados/app/data/providers/rest_client.dart';
import 'package:chamados/core/values/api_path_constans.dart';

class CallCategoryDropdownRepository {

  final RestClient restClient;

  CallCategoryDropdownRepository(this.restClient);

  Future<List<CallCategoryModel>> findAll() async {

    final response = await restClient.get<List<CallCategoryModel>>(
      ApiPath.CALL_CATEGORY_PATH,
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