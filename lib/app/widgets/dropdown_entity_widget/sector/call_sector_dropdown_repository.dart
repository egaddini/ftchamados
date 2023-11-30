import 'package:chamados/app/data/models/rest_exception.dart';
import 'package:chamados/app/data/models/sector_model.dart';
import 'package:chamados/app/data/providers/rest_client.dart';
import 'package:chamados/core/values/api_path_constans.dart';

class CallSectorDropdownRepository {

  final RestClient restClient;

  CallSectorDropdownRepository(this.restClient);

  Future<List<SectorModel>> findAll() async {

    final response = await restClient.get<List<SectorModel>>(
      ApiPath.SECTOR_PATH,
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