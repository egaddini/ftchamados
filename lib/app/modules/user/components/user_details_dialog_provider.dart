import 'package:get/get.dart';

import 'package:chamados/app/data/providers/api_path.dart';

class UserDetailsDialogProvider extends GetConnect {
  Future<List<dynamic>> getSectors() async {
    final response = await get(ApiPath.sector);
    return response.status.hasError
        ? Future.error(response.statusText!)
        : response.body;
  }

  Future<dynamic> putUser(int id, dynamic body) async {
    final response = await put('${ApiPath.user}/$id', body);
    return response.status.hasError
        ? Future.error(response.statusText!)
        : response.body;
  }
}
