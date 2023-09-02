import 'package:chamados/app/constans/api_path.dart';
import 'package:chamados/app/models/error_dto.dart';
import 'package:chamados/app/models/priority.dart';
import 'package:chamados/app/models/rest_exception.dart';
import 'package:chamados/app/repositories/base_repository.dart';
import 'package:chamados/app/utils/helpers/helper.dart';
import 'package:dio/dio.dart';

class PriorityRepository extends BaseRepository<PriorityModel> {

  PriorityRepository() : super(ApiPath.priority);

  Future<List<int>> getFreeWeights() async {
    final response = await Dio().get(
      '$basePath/free-weights',
      options: Options(headers: await getAuthHeader(false)),
    );
    if (response.statusCode == 200) {
      return List<int>.from(response.data);
    } else {
      final ErrorDTO errorDTO = ErrorDTO.fromMap(response.data);
      throw RestException(message: errorDTO.message, statusCode: errorDTO.status);
    }
  }

  @override
  PriorityModel entityFromMap(Map<String, dynamic> map) {
    return PriorityModel.fromMap(map);
  }

  @override
  Map<String, dynamic> entityToMap(PriorityModel entity) {
    return entity.toMap();
  }

  @override
  bool shouldIncludeInList(PriorityModel entity, String query) {
    return entity.name.toLowerCase().contains(query.toLowerCase());
  }
  
}