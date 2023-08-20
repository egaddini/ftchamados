import 'package:chamados/app/constans/api_path.dart';
import 'package:chamados/app/models/call_category_model_.dart';
import 'package:chamados/app/utils/repositories/base_repository.dart';

class CallCategoryRepository extends BaseRepository<CallCategoryModel> {

  CallCategoryRepository() : super(ApiPath.callType);

  @override
  CallCategoryModel entityFromMap(Map<String, dynamic> map) {
    return CallCategoryModel.fromMap(map);
  }

  @override
  Map<String, dynamic> entityToMap(CallCategoryModel entity) {
    return entity.toMap();
  }

  @override
  bool shouldIncludeInList(CallCategoryModel entity, String query) {
    return entity.descricao!.toLowerCase().contains(query.toLowerCase());
  }
  
}