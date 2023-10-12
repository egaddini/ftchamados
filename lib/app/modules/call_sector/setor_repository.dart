import 'package:chamados/app/data/providers/api_path.dart';

import '../../data/models/sector_model.dart';
import '../../repositories/base_repository.dart';

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
