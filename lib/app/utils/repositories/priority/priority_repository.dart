import 'package:chamados/app/models/priority.dart';

abstract class PriorityRepository {

  Future<String> register(PriorityModel priority);
  
  Future<List<PriorityModel>> getPriorityList({String? query});

  Future<String> delete(int id);

}