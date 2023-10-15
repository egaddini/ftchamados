import 'package:get/get.dart';

import '../../../../core/values/api_path_constans.dart';

class UserDetailsDialogProvider extends GetConnect {
  Future<List<dynamic>> getSectors() async {
    final response = await get(ApiPath.SECTOR_PATH);
    return response.status.hasError
        ? Future.error(response.statusText!)
        : response.body;
  }

  Future<dynamic> putUser(int id, dynamic body) async {
    final response = await put('${ApiPath.USER_PATH}/$id', body);
    return response.status.hasError
        ? Future.error(response.statusText!)
        : response.body;
  }
}
