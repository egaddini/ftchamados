import 'package:chamados/app/models/setor.dart';
import 'package:chamados/app/utils/repositories/base_repository.dart';

class SetorRepository extends BaseRepository<Setor> {
  
  SetorRepository() : super("http://localhost:9090/api/v1/call-type/setor");
  
  @override
  Setor entityFromMap(Map<String, dynamic> map) {
    return Setor.fromMap(map);
  }

  @override
  Map<String, dynamic> entityToMap(Setor entity) {
    return entity.toMap();
  }

  @override
  bool shouldIncludeInList(Setor entity, String query) {
    return entity.nome.toLowerCase().contains(query.toLowerCase());
  }

}