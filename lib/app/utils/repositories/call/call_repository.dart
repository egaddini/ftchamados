import 'package:chamados/app/models/call.dart';

abstract class CallRepository {

  Future<String> register(Call call);

}