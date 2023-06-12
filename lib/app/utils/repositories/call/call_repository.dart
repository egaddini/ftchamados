import 'package:chamados/app/models/call_dto.dart';

abstract class CallRepository {

  Future<String> register(CallDTO call);

}