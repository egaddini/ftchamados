import 'package:chamados/app/models/setor.dart';

abstract class SetorRepository {

  Future<String> register(Setor setor);
  
  Future<List<Setor>> getSetorList({String? query});

  Future<String> delete(int id);

}