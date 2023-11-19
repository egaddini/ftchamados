// ignore_for_file: non_constant_identifier_names

import 'package:chamados/app/data/models/call.dart';
import 'package:chamados/app/data/models/call_status_model.dart';
import 'package:chamados/app/data/models/rest_exception.dart';
import 'package:chamados/app/data/providers/rest_client.dart';
import 'package:chamados/app/data/services/app_config/config.dart';
import 'package:chamados/core/utils/helper.dart';
import 'package:chamados/core/values/api_path_constans.dart';


class CallDetailDialogRepository {

  final RestClient api;

  CallDetailDialogRepository(this.api);

  final BASE_PATH = ConfigEnvironments.getEnvironments()['url']!;

  Future<CallStatusModel> setStatus(int callID, int statusID) async {
    final response = await api.get(
      '$BASE_PATH${ApiPath.SET_STATUS_PATH}/$callID',
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
      '$BASE_PATH${ApiPath.CALL_PATH}/$callID',
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

  Future<String> assignSolver(int? solverID, int callID) async {
    final response = await api.get(
      '$BASE_PATH${ApiPath.ASSIGN_SOLVER_PATH}/$callID?solverID=${solverID ?? ''}',
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