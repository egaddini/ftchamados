import 'dart:convert';

import 'package:chamados/app/models/error_dto.dart';
import 'package:chamados/app/models/rest_exception.dart';
import 'package:chamados/app/models/setor.dart';
import 'package:chamados/app/utils/helpers/helper.dart';
import 'package:chamados/app/utils/repositories/setor/setor_repository.dart';
import 'package:dio/dio.dart';


class SetorRepositoryImpl implements SetorRepository {
  
  final String _basePath = "http://localhost:9090/api/v1/call-type/setor";

  @override
  Future<String> register(Setor setor) async {
    String message;
    final result = await Dio().post(
      _basePath,
      data: jsonEncode(setor.toMap()),
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
  Future<List<Setor>> getSetorList({String? query}) async {   
    List<Setor> results = [];

    final response = await Dio().get(
      _basePath, 
      options: Options(headers: await getAuthHeader(false)),
    );
    if (response.statusCode == 200) {
      List<dynamic> jsonList = response.data as List<dynamic>;
      results = jsonList.map((json) => Setor.fromMap(json)).toList();
      if (query != null) {
        results = results.where((element) => element.sigla.toLowerCase().contains((query.toLowerCase()))).toList();
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
      '$_basePath/$id',
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