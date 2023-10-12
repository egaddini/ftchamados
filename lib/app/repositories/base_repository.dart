import 'dart:convert';

import 'package:dio/dio.dart';

import '../../core/utils/helper.dart';
import '../data/models/error_dto.dart';
import '../data/models/rest_exception.dart';

abstract class BaseRepository<T> {
  final String basePath;

  BaseRepository(this.basePath);

  Future<String> register(T entity) async {
    String message;
    final result = await Dio().post(
      basePath,
      data: jsonEncode(entityToMap(entity)),
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

  Future<List<T>> getList({String? query}) async {
    List<T> results = [];

    final response = await Dio().get(
      basePath,
      options: Options(headers: await getAuthHeader(false)),
    );
    if (response.statusCode == 200) {
      List<dynamic> jsonList = response.data as List<dynamic>;
      results = jsonList.map((json) => entityFromMap(json)).toList();
      if (query != null) {
        results = results.where((element) => shouldIncludeInList(element, query)).toList();
      }
    } else {
      final ErrorDTO errorDTO = ErrorDTO.fromMap(response.data);
      throw RestException(message: errorDTO.message, statusCode: errorDTO.status);
    }
    return results;
  }

  Future<String> delete(int id) async {
    String message;
    final result = await Dio().delete(
      '$basePath/$id',
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

  Future<String> update(T entity, int id) async {
    String message;
    final result = await Dio().put(
      '$basePath/$id',
      data: jsonEncode(entityToMap(entity)),
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

  Future<T> getById(int id) async {
    final response = await Dio().get(
      '$basePath/$id',
      options: Options(headers: await getAuthHeader(false)),
    );
    if (response.statusCode == 200) {
      return entityFromMap(response.data);
    } else {
      final ErrorDTO errorDTO = ErrorDTO.fromMap(response.data);
      throw RestException(message: errorDTO.message, statusCode: errorDTO.status);
    }
  }

  T entityFromMap(Map<String, dynamic> map);

  Map<String, dynamic> entityToMap(T entity);

  bool shouldIncludeInList(T entity, String query);
}
