import 'dart:convert';

import 'package:chamados/app/models/call.dart';
import 'package:chamados/app/models/call_dto.dart';
import 'package:chamados/app/models/error_dto.dart';
import 'package:chamados/app/models/rest_exception.dart';
import 'package:chamados/app/utils/helpers/helper.dart';
import 'package:dio/dio.dart';

import 'call_repository.dart';

class CallRepositoryImpl implements CallRepository {

  final String _basePath = "http://localhost:9090/api/v1/call";

  @override
  Future<String> register(CallDTO call) async {
    String message;
    final result = await Dio().post(
      _basePath,
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
  
  @override
  Future<List<Call>> getCallList({String? query}) async {   
    List<Call> results = [];

    final response = await Dio().get(
      _basePath, 
      options: Options(headers: await getAuthHeader(false)),
    );
    if (response.statusCode == 200) {
      List<dynamic> jsonList = response.data as List<dynamic>;
      results = jsonList.map((json) => Call.fromMap(json)).toList();
      if (query != null) {
        results = results.where((element) => element.descricao.toLowerCase().contains((query.toLowerCase()))).toList();
      }
    } else {
      final ErrorDTO errorDTO = ErrorDTO.fromMap(response.data);
      throw RestException(message: errorDTO.message, statusCode: errorDTO.status);
    }
    return results;
  }
}