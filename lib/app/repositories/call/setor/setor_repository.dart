import 'package:chamados/app/constans/api_path.dart';
import 'package:chamados/app/models/sector_model.dart';
import 'package:chamados/app/repositories/base_repository.dart';

class SectorRepository extends BaseRepository<SectorModel> {
  
  SectorRepository() : super(ApiPath.sector);
  
  @override
  SectorModel entityFromMap(Map<String, dynamic> map) {
    return SectorModel.fromMap(map);
  }

  @override
  Map<String, dynamic> entityToMap(SectorModel entity) {
    return entity.toMap();
  }

  @override
  bool shouldIncludeInList(SectorModel entity, String query) {
    return entity.name.toLowerCase().contains(query.toLowerCase());
  }

}