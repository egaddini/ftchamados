import 'package:dio/dio.dart';

import 'package:chamados/app/repositories/base_repository.dart';
import 'package:chamados/core/utils/helper.dart';

import '../../../core/values/api_path_constans.dart';
import '../../data/models/error_dto.dart';
import '../../data/models/priority.dart';
import '../../data/models/rest_exception.dart';

class PriorityRepository extends BaseRepository<PriorityModel> {
  PriorityRepository() : super(ApiPath.PRIORITY_PATH);

  Future<List<int>> getFreeWeights() async {
    final response = await Dio().get(
      '$basePath/free-weights',
      options: Options(headers: await getAuthHeader(false)),
    );
    if (response.statusCode == 200) {
      return List<int>.from(response.data);
    } else {
      final ErrorDTO errorDTO = ErrorDTO.fromMap(response.data);
      throw RestException(
          message: errorDTO.message, statusCode: errorDTO.status);
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
