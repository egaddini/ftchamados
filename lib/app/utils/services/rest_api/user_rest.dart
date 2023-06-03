import 'package:chamados/app/models/user_info_model.dart';
import 'package:chamados/app/utils/services/local_storage/local_storage.dart';
import 'package:chamados/app/utils/services/rest_api/rest_client.dart';

class UserRest {

  static const String basePath = "http://localhost:9090/api/v1/user";
  LocalStorageServices localStorage = LocalStorageServices();
  String? token = "";

  // @override
  Future<List<UserInfoModel>> getuserList({String? query}) async {
    RestClient<List<UserInfoModel>> rest = RestClient(baseUrl: basePath, headers: await getAuthHeader(true));
    return rest.get('');  
  }

    Future<Map<String, String>> getAuthHeader(bool auth) async {
    if (auth) {
      token ??= await localStorage.getToken();
      return {
        'content-type': 'application/json;',
        'authorization': 'Bearer $token'
      };      
    } else {
      return {
        'content-type': 'application/json;',
      };
    }
  }
  
}