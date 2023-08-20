import 'package:chamados/app/constans/api_path.dart';
import 'package:chamados/app/models/priority.dart';
import 'package:chamados/app/repositories/base_repository.dart';

class PriorityRepository extends BaseRepository<PriorityModel> {

  PriorityRepository() : super(ApiPath.priority);

  @override
  PriorityModel entityFromMap(Map<String, dynamic> map) {
    return PriorityModel.fromMap(map);
  }

  @override
  Map<String, dynamic> entityToMap(PriorityModel entity) {
    return entity.toMap();
  }

  @override
  bool shouldIncludeInList(PriorityModel entity, String query) {
    return entity.nome.toLowerCase().contains(query.toLowerCase());
  }
  
}