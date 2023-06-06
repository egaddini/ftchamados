import 'package:chamados/app/models/call_type.dart';

abstract class CallTypeRepository {

  Future<String> register(CallType call);
  
}