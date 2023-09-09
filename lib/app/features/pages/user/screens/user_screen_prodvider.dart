import 'package:get/get.dart';

class UserScreenProvider extends GetConnect {

  static const String _basePath = "http://localhost:9090/api/v1/user";

  Future<List<dynamic>> getUsers() async {
    final response = await get(_basePath);
    return response.status.hasError ?  Future.error(response.statusText!) : response.body;
  }

  Future<dynamic> removeUser(int id) async {
    final response = await delete('$_basePath/$id');
    return response.status.hasError ?  Future.error(response.statusText!) : response.body;
  }
  
}