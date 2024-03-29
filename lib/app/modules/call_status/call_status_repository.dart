import 'package:chamados/app/data/services/app_config/config.dart';
import 'package:dio/dio.dart';

import 'package:chamados/app/repositories/base_repository.dart';
import 'package:chamados/core/utils/helper.dart';

import '../../../core/values/api_path_constans.dart';
import '../../data/models/call_status_model.dart';
import '../../data/models/error_dto.dart';
import '../../data/models/rest_exception.dart';

class CallStatusRepository extends BaseRepository<CallStatusModel> {
  CallStatusRepository() : super(ConfigEnvironments.getEnvironments()['url']! +  ApiPath.STATUS_PATH);

  Future<CallStatusModel> getByName(String name) async {
    final response = await Dio().get(
      '$basePath/name?name=$name',
      options: Options(headers: getAuthHeader()),
    );
    if (response.statusCode == 200) {
      return entityFromMap(response.data);
    } else {
      final ErrorDTO errorDTO = ErrorDTO.fromMap(response.data);
      throw RestException(
          message: errorDTO.message, statusCode: errorDTO.status);
    }
  }

  Future<List<int>> getFreeWeights() async {
    final response = await Dio().get(
      '$basePath/free-weights',
      options: Options(headers: getAuthHeader()),
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
  CallStatusModel entityFromMap(Map<String, dynamic> map) {
    return CallStatusModel.fromMap(map);
  }

  @override
  Map<String, dynamic> entityToMap(CallStatusModel entity) {
    return entity.toMap();
  }

  @override
  bool shouldIncludeInList(CallStatusModel entity, String query) {
    return entity.name.toLowerCase().contains(query.toLowerCase());
  }
}
