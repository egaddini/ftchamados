import 'package:chamados/app/models/call_type_dto.dart';

abstract class CallTypeRepository {

  Future<String> register(CallTypeDTO call);
  
}