import 'dart:convert';

import 'package:dio/dio.dart';

import 'package:chamados/core/utils/helper.dart';

import '../../data/models/call.dart';
import '../../data/models/call_dto.dart';
import '../../data/models/call_status_model.dart';
import '../../data/models/error_dto.dart';
import '../../data/models/rest_exception.dart';

class CallRepository {
  
  final String _basePath = "http://localhost:9090/api/call/v1";

  Future<String> register(CallDTO call) async {
    String message;
    final result = await Dio().post(
      _basePath,
      data: jsonEncode(call.toMap()),
      options: Options(headers: getAuthHeader()),
    );
    if (result.statusCode == 200) {
      message = result.statusMessage!;
    } else {
      final ErrorDTO errorDTO = ErrorDTO.fromMap(result.data);
      throw RestException(message: errorDTO.message, statusCode: errorDTO.status);
    }
    return message;
  }

  Future<List<Call>> getCallList({String? query}) async {
    List<Call> results = [];

    final response = await Dio().get(
      _basePath,
      options: Options(headers: getAuthHeader()),
    );
    if (response.statusCode == 200) {
      List<dynamic> jsonList = response.data as List<dynamic>;
      results = jsonList.map((json) => Call.fromMap(json)).toList();
      if (query != null) {
        results = results
            .where((element) =>
                element.descricao.toLowerCase().contains((query.toLowerCase())))
            .toList();
      }
    } else {
      final ErrorDTO errorDTO = ErrorDTO.fromMap(response.data);
      throw RestException(
          message: errorDTO.message, statusCode: errorDTO.status);
    }
    return results;
  }

  Future<List<Call>> getCallListByEmail(String email, bool isSolver) async {
    List<Call> results = [];

    final response = await Dio().get(
      '$_basePath/email/$email',
      queryParameters: {'isSolver': isSolver},      
      options: Options(headers: getAuthHeader()),
    );
    if (response.statusCode == 200) {
      List<dynamic> jsonList = response.data as List<dynamic>;
      results = jsonList.map((json) => Call.fromMap(json)).toList();
    } else {
      final ErrorDTO errorDTO = ErrorDTO.fromMap(response.data);
      throw RestException(message: errorDTO.message, statusCode: errorDTO.status);
    }
    return results;
  }

  Future<CallStatusModel> setStatus(int callID, int statusID) async {
    final response = await Dio().get(
      '$_basePath/set-status/$callID',
      queryParameters: {'status': statusID.toString()},
      options: Options(headers: getAuthHeader()),
    );
    if (response.statusCode == 200) {
      return CallStatusModel.fromMap(response.data);
    } else {
      final ErrorDTO errorDTO = ErrorDTO.fromMap(response.data);
      throw RestException(
          message: errorDTO.message, statusCode: errorDTO.status);
    }
  }
}
