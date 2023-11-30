// ignore_for_file: non_constant_identifier_names

import 'package:chamados/app/data/models/call_status_model.dart';
import 'package:chamados/app/data/models/rating_model.dart';
import 'package:chamados/app/data/models/rest_exception.dart';
import 'package:chamados/app/data/providers/rest_client.dart';
import 'package:chamados/core/utils/helper.dart';
import 'package:chamados/core/values/api_path_constans.dart';

import '../../../data/models/call.dart';

class CallRequesterDetailDialogRepository {

  final RestClient api;

  CallRequesterDetailDialogRepository(this.api);

  Future<CallStatusModel> setStatus(int callID, int statusID) async {
    final response = await api.get(
      '${ApiPath.SET_STATUS_PATH}/$callID',
      headers: getAuthHeader(),
      query: {'status': statusID.toString()},
      decoder: (body) => CallStatusModel.fromMap(body),
    );
    if (response.hasError) {
      throw RestException(
        message: response.statusText ?? 'Erro',
        statusCode: response.statusCode ?? 0,
      );
    }
    return response.body!;
  }

  Future<Call> findById(int callID) async {
    final response = await api.get(
      '${ApiPath.CALL_PATH}/$callID',
      headers: getAuthHeader(),
      decoder: (body) => Call.fromMap(body),
    );
    if (response.hasError) {
      throw RestException(
        message: response.statusText ?? 'Erro',
        statusCode: response.statusCode ?? 0,
      );
    }
    return response.body!;
  }

  Future<String> rate(RatingModel rating) async {
    final response = await api.post(
      ApiPath.RATING_PATH,
      rating.toJson(),
      headers: getAuthHeader(),
    );
    if (response.hasError) {
      throw RestException(
        message: response.statusText ?? 'Erro',
        statusCode: response.statusCode ?? 0,
      );
    }
    return response.body!['message'];
  }

}