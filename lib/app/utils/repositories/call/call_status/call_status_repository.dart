import 'package:chamados/app/constans/api_path.dart';
import 'package:chamados/app/models/call_status_model.dart';
import 'package:chamados/app/utils/repositories/base_repository.dart';

class CallStatusRepository extends BaseRepository<CallStatusModel> {
  
  CallStatusRepository() : super(ApiPath.status);
  
  @override
  CallStatusModel entityFromMap(Map<String, dynamic> map) {
    return CallStatusModel.fromMap(map);
  }

  @override
  Map<String, dynamic> entityToMap(CallStatusModel entity) {
    return entity.toMap();
  }

  @override
  bool shouldIncludeInList(CallStatusModel entity, String query) {
    return entity.name.toLowerCase().contains(query.toLowerCase());
  }

}