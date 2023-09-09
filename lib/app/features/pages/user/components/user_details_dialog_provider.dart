import 'package:chamados/app/constans/api_path.dart';
import 'package:get/get.dart';

class UserDetailsDialogProvider extends GetConnect {


  Future<List<dynamic>> getSectors() async {
    final response = await get(ApiPath.sector);
    return response.status.hasError ?  Future.error(response.statusText!) : response.body;
  }

  Future<dynamic> putUser(int id, dynamic body) async {
    final response = await put('${ApiPath.user}/$id', body);
    return response.status.hasError ?  Future.error(response.statusText!) : response.body;
  }
  
}