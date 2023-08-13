import 'package:chamados/app/constans/api_path.dart';
import 'package:chamados/app/models/setor.dart';
import 'package:chamados/app/utils/repositories/base_repository.dart';

class SetorRepository extends BaseRepository<Setor> {
  
  SetorRepository() : super(ApiPath.sector);
  
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