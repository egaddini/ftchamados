

import 'package:chamados/app/utils/services/local_storage/local_storage.dart';

mixin HeaderMixin {

  Future<Map<String, String>> getAuthHeader() async {
    LocalStorageServices storage = LocalStorageServices();
    String? token = await storage.getToken();

    return {
      'content-type': 'application/json;',
      'authorization': 'Bearer $token'
    };      
  }

  Future<Map<String, String>> getBasicHeader() async {
    return {
      'content-type': 'application/json;',
    };      
  }

}
