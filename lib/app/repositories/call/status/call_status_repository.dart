import 'package:chamados/app/constans/api_path.dart';
import 'package:chamados/app/models/call_status_model.dart';
import 'package:chamados/app/models/error_dto.dart';
import 'package:chamados/app/models/rest_exception.dart';
import 'package:chamados/app/utils/helpers/helper.dart';
import 'package:chamados/app/repositories/base_repository.dart';
import 'package:dio/dio.dart';

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
      throw RestException(message: errorDTO.message, statusCode: errorDTO.status);
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
      throw RestException(message: errorDTO.message, statusCode: errorDTO.status);
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