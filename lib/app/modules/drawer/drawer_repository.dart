
import 'package:chamados/app/data/models/rest_exception.dart';
import 'package:chamados/app/data/models/user_notification.dart';
import 'package:chamados/app/data/providers/rest_client.dart';
import 'package:chamados/core/values/api_path_constans.dart';

class DrawerRepository {

  final RestClient _restClient;

  DrawerRepository(this._restClient);

  Future<List<UserNotification>> findNotifications(int id) async {
    final response = await _restClient.get<List<UserNotification>>(
      '${ApiPath.NOTIFICATIONS_PATH}/$id',
      decoder: (response) => UserNotification.fromDynamic(response as List<dynamic>)
    );

    if (response.hasError) {
      throw RestException(
        message: response.statusText ?? 'Erro',
        statusCode: response.statusCode ?? 0,
      );
    }
    
    return response.body as List<UserNotification>;
  }

  Future<String> readNotifications(int id) async {
    final response = await _restClient.get(
      '${ApiPath.READ_NOTIFICATIONS_PATH}/$id',
    );

    if (response.hasError) {
      throw RestException(
        message: response.statusText ?? 'Erro',
        statusCode: response.statusCode ?? 0,
      );
    }
    return response.body['message'];
  }
}