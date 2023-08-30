import 'package:chamados/app/models/call.dart';
import 'package:chamados/app/models/call_dto.dart';

abstract class CallRepository {

  Future<String> register(CallDTO call);

  Future<List<Call>> getCallList({String? query});

  Future<List<Call>> getCallListByEmail(String email);

}