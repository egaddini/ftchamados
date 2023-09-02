import 'dart:convert';

import 'package:chamados/app/constans/api_path.dart';
import 'package:chamados/app/models/call_category_model.dart';
import 'package:chamados/app/models/call_category_register_model.dart';
import 'package:chamados/app/models/error_dto.dart';
import 'package:chamados/app/models/rest_exception.dart';
import 'package:chamados/app/utils/helpers/helper.dart';
import 'package:chamados/app/repositories/base_repository.dart';
import 'package:dio/dio.dart';

class CallCategoryRepository extends BaseRepository<CallCategoryModel> {

  CallCategoryRepository() : super(ApiPath.callType);
  
  Future<String> registerByRegisterModel(CallCategoryRegisterModel entity) async {
    String message;
    final result = await Dio().post(
      basePath,
      data: jsonEncode(entity.toMap()),
      options: Options(headers: await getAuthHeader(false)),
    );
    if (result.statusCode == 200) {
      message = result.statusMessage!;
    } else {
      final ErrorDTO errorDTO = ErrorDTO.fromMap(result.data);
      throw RestException(message: errorDTO.message, statusCode: errorDTO.status);
    }
    return message;
  }

  @override
  CallCategoryModel entityFromMap(Map<String, dynamic> map) {
    return CallCategoryModel.fromMap(map);
  }

  @override
  Map<String, dynamic> entityToMap(CallCategoryModel entity) {
    return entity.toMap();
  }

  @override
  bool shouldIncludeInList(CallCategoryModel entity, String query) {
    return entity.description!.toLowerCase().contains(query.toLowerCase());
  }
  
  
}