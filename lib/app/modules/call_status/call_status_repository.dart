import 'package:dio/dio.dart';

import 'package:chamados/app/data/providers/api_path.dart';
import 'package:chamados/app/repositories/base_repository.dart';
import 'package:chamados/core/utils/helper.dart';

import '../../data/models/call_status_model.dart';
import '../../data/models/error_dto.dart';
import '../../data/models/rest_exception.dart';

class CallStatusRepository extends BaseRepository<CallStatusModel> {
  CallStatusRepository() : super(ApiPath.status);

  Future<CallStatusModel> getByName(String name) async {
    final response = await Dio().get(
      '$basePath/name?name=$name',
      options: Options(headers: await getAuthHeader(false)),
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
