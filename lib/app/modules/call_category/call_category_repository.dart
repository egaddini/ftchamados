import 'dart:convert';

import 'package:dio/dio.dart';

import 'package:chamados/app/data/providers/api_path.dart';
import 'package:chamados/core/utils/helper.dart';

import '../../data/models/call_category_model.dart';
import '../../data/models/call_category_register_model.dart';
import '../../data/models/error_dto.dart';
import '../../data/models/rest_exception.dart';
import '../../repositories/base_repository.dart';

class CallCategoryRepository extends BaseRepository<CallCategoryModel> {
  CallCategoryRepository() : super(ApiPath.callType);

  Future<String> registerByRegisterModel(
      CallCategoryRegisterModel entity) async {
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
      throw RestException(
          message: errorDTO.message, statusCode: errorDTO.status);
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
