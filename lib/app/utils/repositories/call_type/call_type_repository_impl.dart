import 'dart:convert';

import 'package:chamados/app/models/call_type.dart';
import 'package:chamados/app/models/error_dto.dart';
import 'package:chamados/app/models/rest_exception.dart';
import 'package:chamados/app/utils/helpers/helper.dart';
import 'package:chamados/app/utils/repositories/call_type/call_type_repository.dart';
import 'package:dio/dio.dart';


class CallTypeRepositoryImpl implements CallTypeRepository {
  
  final String BASE_PATH = "http://localhost:9090/api/v1/auth";

  @override
  Future<String> register(CallType call) async {
    String message;
    final result = await Dio().post(
      BASE_PATH,
      data: jsonEncode(call.toMap()),
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

}