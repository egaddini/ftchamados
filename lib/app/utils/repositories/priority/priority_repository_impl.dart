
import 'dart:convert';

import 'package:chamados/app/models/error_dto.dart';
import 'package:chamados/app/models/priority.dart';
import 'package:chamados/app/models/rest_exception.dart';
import 'package:chamados/app/utils/helpers/helper.dart';
import 'package:chamados/app/utils/repositories/priority/priority_repository.dart';
import 'package:dio/dio.dart';

class PriorityRepositoryImpl implements PriorityRepository {
  
  final String BASE_PATH = "http://localhost:9090/api/v1/call/priority";

  @override
  Future<String> register(PriorityModel priority) async {
    String message;
    final result = await Dio().post(
      BASE_PATH,
      data: jsonEncode(priority.toMap()),
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
  Future<List<PriorityModel>> getSetorList({String? query}) async {   
    List<PriorityModel> results = [];

    final response = await Dio().get(
      BASE_PATH, 
      options: Options(headers: await getAuthHeader(false)),
    );
    if (response.statusCode == 200) {
      List<dynamic> jsonList = response.data as List<dynamic>;
      results = jsonList.map((json) => PriorityModel.fromMap(json)).toList();
      if (query != null) {
        results = results.where((element) => element.nome.toLowerCase().contains((query.toLowerCase()))).toList();
      }
    } else {
      final ErrorDTO errorDTO = ErrorDTO.fromMap(response.data);
      throw RestException(message: errorDTO.message, statusCode: errorDTO.status);
    }
    return results;
  }

  @override
  Future<String> delete(int id) async {
    String message;
    final result = await Dio().delete(
      '$BASE_PATH/$id',
      options: Options(headers: await getAuthHeader(true)),
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