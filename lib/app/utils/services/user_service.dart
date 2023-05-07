

import 'package:chamados/app/models/call.dart';
import 'package:chamados/app/models/call_type.dart';
import 'package:chamados/app/models/user_info_model.dart';
import 'package:flutter/material.dart';

abstract class UserService {
  UserInfoModel getLogedUserInfo(BuildContext context);
  List<UserInfoModel> getAllUsersInfo(BuildContext context);
  List<CallType> getAllCallTypes();
  List<Call> getCalls();
}

class UserServiceImpl implements UserService {


  @override
  UserInfoModel getLogedUserInfo(BuildContext context) {
    return UserInfoModel(
          id: 1,
          firstname: 'Edder',
          lastname: 'Gaddini',
          email: 'eddergaddini@gmail.com',
          role: 'admin',
          token: '289798897789',
        );
  }

  @override
  List<UserInfoModel> getAllUsersInfo(BuildContext context) {
    return [
        UserInfoModel(
          id: 1,
          firstname: 'Edder',
          lastname: 'Gaddini',
          email: 'eddergaddini@gmail.com',
          role: 'admin',
          token: '289798897789',
        ),
        UserInfoModel(
          id: 2,
          firstname: 'Bob',
          lastname: 'Brown',
          email: 'bob.brown@example.com',
          role: 'user',
          token: '456-789-123',
        ),
        UserInfoModel(
          id: 3,
          firstname: 'Charlie',
          lastname: 'Clark',
          email: 'charlie.clark@example.com',
          role: 'user',
          token: '789-123-456',
        ),
        UserInfoModel(
          id: 4,
          firstname: 'David',
          lastname: 'Davis',
          email: 'david.davis@example.com',
          role: 'moderator',
          token: '123-789-456',
        ),
        UserInfoModel(
          id: 5,
          firstname: 'Eve',
          lastname: 'Evans',
          email: 'eve.evans@example.com',
          role: 'user',
          token: '456-123-789',
        ),
        UserInfoModel(
          id: 6,
          firstname: 'Frank',
          lastname: 'Franklin',
          email: 'frank.franklin@example.com',
          role: 'user',
          token: '789-456-123',
        ),
        UserInfoModel(
          id: 7,
          firstname: 'Grace',
          lastname: 'Garcia',
          email: 'grace.garcia@example.com',
          role: 'admin',
          token: '123-456-789',
        ),
        UserInfoModel(
          id: 8,
          firstname: 'Heidi',
          lastname: 'Harris',
          email: 'heidi.harris@example.com',
          role: 'user',
          token: '456-789-123',
        ),
        UserInfoModel(
          id: 9,
          firstname: 'Isaac',
          lastname: 'Ingram',
          email: 'isaac.ingram@example.com',
          role: 'user',
          token: '789-123-456',
        ),
        UserInfoModel(
          id: 10,
          firstname: 'Judy',
          lastname: 'Johnson',
          email: 'judy.johnson@example.com',
          role: 'moderator',
          token: '123-789-456',
        ),
      ];
  }

  @override
  List<CallType> getAllCallTypes() { return [getCallType1(), getCallType2(), getCallType3(), getCallType4(), getCallType5(), getCallType6(), ]; }

  CallType getCallType1() {
    return CallType(id: 1, sigla: 'TEC', setor: 'Tecnologia', titulo: 'Formatar computador', prioridade: 'URGENTE', descricao: 'Para caso seu computador tenha problemas ou esteja com virus.');
  }
  CallType getCallType2() {
    return CallType(id: 2, sigla: 'TEC', setor: 'Tecnologia', titulo: 'Formatar calculadora', prioridade: 'SEM PRIORIDADE', descricao: 'Para caso sua calculadora apresente problemas.');
  }
  CallType getCallType3() {
    return CallType(id: 3, sigla: 'TEC', setor: 'Tecnologia', titulo: 'Erro visual na aplicação X.', prioridade: 'LEVE', descricao: 'Para caso seja identificado erro visual em algum componente da aplicação X.');
  }
  CallType getCallType4() {
    return CallType(id: 4, sigla: 'INF', setor: 'Infraestrutura', titulo: 'Teclado Novo', prioridade: 'MÉDIA', descricao: 'Solicitação de periférico.');
  }
  CallType getCallType5() {
    return CallType(id: 5, sigla: 'INF', setor: 'Infraestrutura', titulo: 'Problema na catraca de acesso a empresa', prioridade: 'URGENTE', descricao: 'Problema relacionado ao acesso a empresa.');
  }
  CallType getCallType6() {
    return CallType(id: 6, sigla: 'GEN', setor: 'Todos', titulo: 'Chamado', prioridade: 'A VERIFICAR', descricao: 'Para criar chamado de problemas\necessidades que não tenham sido cadastradas.');
  }

  @override
  List<CallType> getSuggestions(String query) {
    List<CallType> matches = [];
    matches.addAll(getAllCallTypes());
    matches.retainWhere((s) => s.descricao.toLowerCase().contains(query.toLowerCase()));
    return matches;
  } 
  

  @override
  List<Call> getCalls() {
    return [
      Call(id: '1', callType: getCallType1(), usuario: 'Agenor', descricao: 'descricao', status: 'null', dataCriacao: DateTime.now(), dataUltAtualizacao: DateTime.now(), participantes: ['edder', 'Agenor']),
      Call(id: '1', callType: getCallType6(), usuario: 'Agenor', descricao: 'descricao', status: 'null', dataCriacao: DateTime.now(), dataUltAtualizacao: DateTime.now(), participantes: ['edder', 'Agenor']),
      Call(id: '1', callType: getCallType6(), usuario: 'Agenor', descricao: 'descricao', status: 'null', dataCriacao: DateTime.now(), dataUltAtualizacao: DateTime.now(), participantes: ['edder', 'Agenor']),
      Call(id: '1', callType: getCallType3(), usuario: 'Agenor', descricao: 'descricao', status: 'null', dataCriacao: DateTime.now(), dataUltAtualizacao: DateTime.now(), participantes: ['edder', 'Agenor']),
      Call(id: '1', callType: getCallType3(), usuario: 'Agenor', descricao: 'descricao', status: 'null', dataCriacao: DateTime.now(), dataUltAtualizacao: DateTime.now(), participantes: ['edder', 'Agenor']),
      Call(id: '1', callType: getCallType6(), usuario: 'Agenor', descricao: 'descricao', status: 'null', dataCriacao: DateTime.now(), dataUltAtualizacao: DateTime.now(), participantes: ['edder', 'Agenor']),
      Call(id: '1', callType: getCallType4(), usuario: 'Agenor', descricao: 'descricao', status: 'null', dataCriacao: DateTime.now(), dataUltAtualizacao: DateTime.now(), participantes: ['edder', 'Agenor']),
      Call(id: '1', callType: getCallType2(), usuario: 'Agenor', descricao: 'descricao', status: 'null', dataCriacao: DateTime.now(), dataUltAtualizacao: DateTime.now(), participantes: ['edder', 'Agenor']),
      Call(id: '1', callType: getCallType5(), usuario: 'Agenor', descricao: 'descricao', status: 'null', dataCriacao: DateTime.now(), dataUltAtualizacao: DateTime.now(), participantes: ['edder', 'Agenor']),
      Call(id: '1', callType: getCallType1(), usuario: 'Agenor', descricao: 'descricao', status: 'null', dataCriacao: DateTime.now(), dataUltAtualizacao: DateTime.now(), participantes: ['edder', 'Agenor']),
       
    ];
  }
  
}



